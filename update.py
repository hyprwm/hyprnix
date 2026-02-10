#!/usr/bin/env python3
"""
Update script for Hyprland ecosystem packages in flake.nix.

This script:
1. Parses flake.lock to get current locked versions
2. Updates flake.nix URLs with new versions from GitHub API
3. Optionally validates that updated flake.lock matches the new tags
"""

import argparse
import json
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request
from dataclasses import dataclass
from pathlib import Path
from typing import Any


FLAKE_LOCK_PATH = Path("flake.lock")
FLAKE_NIX_PATH = Path("flake.nix")
VERBOSE = False


@dataclass
class GitTag:
    name: str


@dataclass
class UpdateResult:
    input_name: str
    repo_name: str
    old_version: str
    new_version: str


def parse_version(tag_name: str) -> tuple[int, int, int]:
    """Parse a version tag like 'v1.2.3' into comparable tuple."""
    if not tag_name.startswith("v"):
        return (0, 0, 0)

    version = tag_name[1:]
    parts = version.split(".")

    def parse_part(part: str) -> int:
        digits = "".join(ch for ch in part if ch.isdigit())
        return int(digits) if digits else 0

    while len(parts) < 3:
        parts.append("0")

    return (parse_part(parts[0]), parse_part(parts[1]), parse_part(parts[2]))


def load_json(path: Path) -> dict[str, Any]:
    """Load and parse a JSON file."""
    try:
        with open(path, "r") as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: {path} not found")
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"Error parsing {path}: {e}")
        sys.exit(1)


def read_text(path: Path) -> str:
    """Read text file contents."""
    try:
        return path.read_text()
    except OSError as e:
        print(f"Error reading {path}: {e}")
        sys.exit(1)


def write_text(path: Path, content: str) -> None:
    """Write text to a file."""
    try:
        path.write_text(content)
    except OSError as e:
        print(f"Error writing {path}: {e}")
        sys.exit(1)


def fetch_github_tags(owner: str, repo: str, token: str | None = None) -> list[GitTag] | None:
    """Fetch version tags from GitHub API. Returns None on rate limit, empty list on other errors."""
    url = f"https://api.github.com/repos/{owner}/{repo}/tags"

    headers = {"User-Agent": "hyprnix/1.0"}
    if token:
        headers["Authorization"] = f"token {token}"

    try:
        request = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(request, timeout=30) as response:
            raw = response.read()
            tags_data = json.loads(raw.decode())
            return [
                GitTag(name=tag["name"])
                for tag in tags_data
                if isinstance(tag.get("name"), str) and tag["name"].startswith("v")
            ]
    except urllib.error.HTTPError as e:
        body = e.read().decode()
        if e.code == 403 and "rate limit" in body.lower():
            return None
        if VERBOSE:
            print(f"  [*] HTTP {e.code} for {owner}/{repo}")
            print(f"  [*] Response: {body}")
        return []
    except urllib.error.URLError as e:
        if VERBOSE:
            print(f"  [*] URL error for {owner}/{repo}: {e.reason}")
        return []


def latest_stable_tag(tags: list[GitTag]) -> GitTag | None:
    """Return the latest stable version tag from a list."""
    stable_keywords = ("alpha", "beta", "rc", "-")

    def is_stable(tag: GitTag) -> bool:
        name_lower = tag.name.lower()
        return not any(kw in name_lower for kw in stable_keywords)

    stable_tags = [t for t in tags if is_stable(t)]
    candidates = stable_tags if stable_tags else tags

    if not candidates:
        return None

    return max(candidates, key=lambda t: parse_version(t.name))


def current_version(flake_lock: dict[str, Any], input_name: str) -> str | None:
    """Extract current version from flake.lock for an input."""
    nodes: dict[str, Any] = flake_lock.get("nodes", {})
    node: dict[str, Any] = nodes.get(input_name, {})

    if not isinstance(node, dict):
        return None

    original: dict[str, Any] = node.get("original", {})
    if not isinstance(original, dict):
        return None

    ref: str = original.get("ref", "")
    return ref if isinstance(ref, str) and ref.startswith("v") else None


def parse_hypr_inputs(flake_nix_content: str) -> dict[str, str]:
    """Extract hyprwm inputs from flake.nix content."""
    pattern = re.compile(
        r"([A-Za-z0-9_-]+)\s*=\s*\{.*?url\s*=\s*\"github:hyprwm/([^/]+)/([^\"]+)\".*?\}",
        re.DOTALL,
    )

    inputs: dict[str, str] = {}
    for match in pattern.finditer(flake_nix_content):
        input_name = match.group(1)
        repo_name = match.group(2)
        if repo_name != "nixpkgs":
            inputs[input_name] = repo_name

    return inputs


def update_flake_nix_url(
    content: str, input_name: str, new_version: str, repo_name: str
) -> str:
    """Update a URL in flake.nix for a specific input."""
    escaped_name = re.escape(input_name)
    prefix = (
        rf'(\s+{escaped_name}\s*=\s*\{{\s+url\s*=\s*)"github:hyprwm/{repo_name}/[^"]+"'
    )
    replacement = rf'\1"github:hyprwm/{repo_name}/{new_version}"'
    return re.sub(prefix, replacement, content)


def create_backup(path: Path) -> Path | None:
    """Create a timestamped backup of a file."""
    if not path.exists():
        return None

    timestamp = int(time.time())
    backup_path = path.parent / f"{path.name}.backup.{timestamp}"

    try:
        backup_path.write_text(path.read_text())
        return backup_path
    except OSError:
        return None


def run_nix_command(
    args: list[str], timeout: int = 600
) -> subprocess.CompletedProcess[str]:
    """Run a nix command and return the result."""
    return subprocess.run(
        args,
        capture_output=True,
        text=True,
        timeout=timeout,
        check=False,
    )


def validate_flake() -> bool:
    """Run nix flake check to validate the flake."""
    try:
        result = run_nix_command(["nix", "flake", "check", "--no-build"], timeout=300)
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        print("[!] Warning: flake check timed out")
        return False
    except FileNotFoundError:
        print("[!] Warning: nix command not found")
        return False


def parse_args() -> argparse.Namespace:
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description="Update Hyprland ecosystem packages in flake.nix"
    )
    _ = parser.add_argument(
        "--update",
        metavar="INPUT",
        help="Update a specific input (e.g., hyprland)",
    )
    _ = parser.add_argument(
        "--update-all",
        action="store_true",
        help="Update all inputs (default behavior)",
    )
    _ = parser.add_argument(
        "--validate",
        action="store_true",
        help="Validate flake.lock matches flake.nix after update",
    )
    _ = parser.add_argument(
        "--no-lock",
        action="store_true",
        help="Skip updating flake.lock after modifying flake.nix",
    )
    _ = parser.add_argument(
        "--token",
        metavar="TOKEN",
        help="GitHub Personal Access Token to bypass rate limits",
    )
    _ = parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help="Enable verbose output for debugging failed requests",
    )

    parsed = parser.parse_args()
    parsed.update_all = parsed.update_all or not parsed.update
    return parsed


def main() -> None:
    """Main entry point."""
    global VERBOSE
    args = parse_args()
    VERBOSE = args.verbose

    print("[-] Analyzing current flake configuration...")

    flake_lock = load_json(FLAKE_LOCK_PATH)
    flake_nix_content = read_text(FLAKE_NIX_PATH)
    hypr_inputs = parse_hypr_inputs(flake_nix_content)

    if not hypr_inputs:
        print("[!] No Hyprland ecosystem inputs found in flake.nix")
        sys.exit(1)

    if args.update:
        if args.update not in hypr_inputs:
            print(f"[!] Input '{args.update}' not found in flake.nix")
            print(f"Available inputs: {', '.join(sorted(hypr_inputs.keys()))}")
            sys.exit(1)
        hypr_inputs = {args.update: hypr_inputs[args.update]}
        print(f"[+] Updating specific input: {args.update}")
    else:
        print(f"[+] Found {len(hypr_inputs)} Hyprland ecosystem inputs")

    results: list[UpdateResult] = []
    rate_limited_repos: set[str] = set()

    for input_name, repo_name in hypr_inputs.items():
        print(f"\n[-] Checking {input_name} ({repo_name})...")

        current_ver = current_version(flake_lock, input_name)
        if not current_ver:
            print(f"  [!] Could not determine current version for {input_name}")
            continue

        print(f"  [>] Current version: {current_ver}")

        tags = fetch_github_tags("hyprwm", repo_name, args.token)

        if tags is None:
            rate_limited_repos.add(repo_name)
            continue

        latest_tag = latest_stable_tag(tags)

        if not latest_tag:
            print(f"  [!] Could not fetch latest version for {repo_name}")
            continue

        print(f"  [<] Latest version: {latest_tag.name}")

        if tags:
            tag_preview = ", ".join(t.name for t in tags[:10])
            print(f"  [i] Available tags (first 10): {tag_preview}")

        if latest_tag.name != current_ver:
            print(f"  [+] Update available: {current_ver} -> {latest_tag.name}")

            new_content = update_flake_nix_url(
                flake_nix_content, input_name, latest_tag.name, repo_name
            )
            if new_content != flake_nix_content:
                flake_nix_content = new_content
                results.append(
                    UpdateResult(
                        input_name=input_name,
                        repo_name=repo_name,
                        old_version=current_ver,
                        new_version=latest_tag.name,
                    )
                )
        else:
            print("  [=] Up to date")

    if rate_limited_repos:
        print(f"\n[!] Rate limited on {len(rate_limited_repos)} repo(s): {', '.join(sorted(rate_limited_repos))}")
        print("[!] Use --token to provide a GitHub PAT to bypass rate limits.")

    if not results:
        print("\n[+] All inputs are up to date!")
        return

    print("\n[-] Updates to apply:")
    for r in results:
        print(f"  - {r.input_name}: {r.old_version} -> {r.new_version}")

    backup = create_backup(FLAKE_NIX_PATH)
    if backup:
        print(f"[+] Backup created: {backup.name}")

    write_text(FLAKE_NIX_PATH, flake_nix_content)
    print("[+] flake.nix updated successfully")

    if args.no_lock:
        print("[-] Skipping flake.lock update (--no-lock)")
    else:
        print("\n[-] Updating flake.lock...")
        result = run_nix_command(["nix", "flake", "lock"])

        if result.returncode != 0:
            print(f"[!] Warning: flake lock had issues: {result.stderr}")
        else:
            print("[+] flake.lock updated")

    if args.validate:
        print("\n[-] Validating updated flake...")
        if validate_flake():
            print("[+] Validation passed - flake.lock matches flake.nix")
        else:
            print("[!] Validation failed - flake.lock may not match flake.nix")

    print(f"\n[+] Update complete! Applied {len(results)} updates.")
    print("[i] Run 'nix flake check' to verify everything works correctly.")


if __name__ == "__main__":
    main()
