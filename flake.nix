{
  description = "Hypr* ecosystem stable release flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    aquamarine = {
      url = "github:hyprwm/aquamarine/v0.10.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprcursor = {
      url = "github:hyprwm/hyprcursor/v0.1.13";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprlang.follows = "hyprlang";
    };

    hyprgraphics = {
      url = "github:hyprwm/hyprgraphics/v0.5.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    hypridle = {
      url = "github:hyprwm/hypridle/v0.1.7";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprland-protocols.follows = "hyprland-protocols";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland = {
      url = "github:hyprwm/hyprland/v0.54.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprcursor.follows = "hyprcursor";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprland-guiutils.follows = "hyprland-guiutils";
      inputs.hyprland-protocols.follows = "hyprland-protocols";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
      inputs.hyprwire.follows = "hyprwire";
      inputs.xdph.follows = "xdph";
    };

    hyprland-guiutils = {
      url = "github:hyprwm/hyprland-guiutils/v0.2.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland-protocols = {
      url = "github:hyprwm/hyprland-protocols/v0.7.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    hyprland-qt-support = {
      url = "github:hyprwm/hyprland-qt-support/v0.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    hyprlang = {
      url = "github:hyprwm/hyprlang/v0.6.8";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprlauncher = {
      url = "github:hyprwm/hyprlauncher/v0.1.5";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
      inputs.hyprwire.follows = "hyprwire";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock/v0.9.2";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper/v0.8.3";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
      inputs.hyprwire.follows = "hyprwire";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker/v0.4.6";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpolkitagent = {
      url = "github:hyprwm/hyprpolkitagent/v0.1.3";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprland-qt-support.follows = "hyprland-qt-support";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprpwcenter = {
      url = "github:hyprwm/hyprpwcenter/v0.1.2";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprshutdown = {
      url = "github:hyprwm/hyprshutdown/v0.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprsunset = {
      url = "github:hyprwm/hyprsunset/v0.3.3";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprland-protocols.follows = "hyprland-protocols";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprtoolkit = {
      url = "github:hyprwm/hyprtoolkit/v0.5.3";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprutils = {
      url = "github:hyprwm/hyprutils/v0.11.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner/v0.4.5";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    hyprwire = {
      url = "github:hyprwm/hyprwire/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland/v1.3.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprland-protocols.follows = "hyprland-protocols";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    systems = import inputs.systems;
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (
        system:
          f {
            inherit system;
            pkgs = import nixpkgs {inherit system;};
          }
      );
  in {
    packages = forAllSystems (
      {system, ...}:
        {
          default = self.packages.${system}.hyprland;
          inherit (inputs.aquamarine.packages.${system}) aquamarine;
          inherit (inputs.hyprcursor.packages.${system}) hyprcursor;
          inherit (inputs.hyprgraphics.packages.${system}) hyprgraphics;
          inherit (inputs.hypridle.packages.${system}) hypridle;
          inherit (inputs.hyprland-guiutils.packages.${system}) hyprland-guiutils;
          inherit (inputs.hyprland.packages.${system}) hyprland;
          inherit (inputs.hyprland-protocols.packages.${system}) hyprland-protocols;
          inherit (inputs.hyprland-qt-support.packages.${system}) hyprland-qt-support;
          inherit (inputs.hyprlang.packages.${system}) hyprlang;
          inherit (inputs.hyprlauncher.packages.${system}) hyprlauncher;
          inherit (inputs.hyprlock.packages.${system}) hyprlock;
          inherit (inputs.hyprpaper.packages.${system}) hyprpaper;
          inherit (inputs.hyprpicker.packages.${system}) hyprpicker;
          inherit (inputs.hyprpolkitagent.packages.${system}) hyprpolkitagent;
          inherit (inputs.hyprpwcenter.packages.${system}) hyprpwcenter;
          inherit (inputs.hyprshutdown.packages.${system}) hyprshutdown;
          inherit (inputs.hyprsunset.packages.${system}) hyprsunset;
          inherit (inputs.hyprtoolkit.packages.${system}) hyprtoolkit;
          inherit (inputs.hyprutils.packages.${system}) hyprutils;
          inherit (inputs.hyprwayland-scanner.packages.${system}) hyprwayland-scanner;
          inherit (inputs.hyprwire.packages.${system}) hyprwire;
          inherit (inputs.xdph.packages.${system}) xdg-desktop-portal-hyprland;
        }
    );

    formatter = forAllSystems ({pkgs, ...}: pkgs.nixfmt-tree);

    checks = self.packages;

    overlays.default =
      with nixpkgs.lib;
      (composeManyExtensions (
        mapAttrsToList (input: _: inputs.${input}.overlays.default) (
          filterAttrs (name: _: name != "self" && name != "nixpkgs" && name != "systems") inputs
        )
      ));
    };

}
