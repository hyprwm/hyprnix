# HyprWM Nix Repo

Hypr Ecosystem releases in one place.

## Packages

To view a list of all packages, either check the `flake.nix` file or run:

```sh
nix flake show github:hyprwm/hyprnix
```

## Installing

> [!IMPORTANT]
> Make sure to set up [Cachix](https://wiki.hypr.land/Nix/Cachix/) before
> installing.

> [!NOTE]
> All snippets in the wiki that advise using `inputs.hyprland` should be changed
> to `inputs.hyprnix` instead. `inputs.hyprland.url = "github:hyprwm/hyprland"`
> should be changed to `inputs.hyprnix.url = "github:hyprwm/hyprnix"`.

### NixOS

Follow the guide over at
[Hyprland on NixOS](https://wiki.hypr.land/Nix/Hyprland-on-NixOS/).

### Non-NixOS (other distros)

Follow the guide over at
[Hyprland on Other Distros](https://wiki.hypr.land/Nix/Hyprland-on-other-distros/).

## Maintenance

[update script]: ./update.py

Due to locked tags, `nix flake update` is not able to update most of Hyprland
ecosystem packages. In other words; running `nix flake update` will ONLY update
packages without a tag specified, which are `nixpkgs` and `systems` inputs.

To make updating Hypr* packages easier, an [update script] is provided. The
default behaviour is to update all inputs at once, which is also implied by the
`--update-all` flag. To update one or more specific inputs, use the `--update`
flag and specify the input(s) that you want to update:

```bash
# Python is provided by the dev shell
$ python3 update.py --update hyprland --update hyprlang

# Or all inputs at once
$ python3 update.py
```

If you get rate-limited, pass an access token via `--token`. If you use `gh`, you can get it by running `gh auth token`.
