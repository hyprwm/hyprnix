{
  description = "Hypr* ecosystem stable release flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    aquamarine.url = "github:hyprwm/aquamarine/v0.14.0";
    aquamarine.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprcursor.url = "github:hyprwm/hyprcursor/v0.1.13";
    hyprcursor.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprlang.follows = "hyprlang";
    };

    hyprgraphics.url = "github:hyprwm/hyprgraphics/v0.5.1";
    hyprgraphics.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
    };

    hypridle.url = "github:hyprwm/hypridle/v0.1.8";
    hypridle.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland.url = "github:hyprwm/hyprland/v0.56.1";
    hyprland.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprcursor.follows = "hyprcursor";
      hyprgraphics.follows = "hyprgraphics";
      hyprland-guiutils.follows = "hyprland-guiutils";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
      hyprwire.follows = "hyprwire";
      xdph.follows = "xdph";
    };

    hyprland-guiutils.url = "github:hyprwm/hyprland-guiutils/v0.2.2";
    hyprland-guiutils.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland-protocols.url = "github:hyprwm/hyprland-protocols/v0.7.0";
    hyprland-protocols.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprland-qt-support.url = "github:hyprwm/hyprland-qt-support/v0.1.0";
    hyprland-qt-support.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprlang.url = "github:hyprwm/hyprlang/v0.6.8";
    hyprlang.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
    };

    hyprlauncher.url = "github:hyprwm/hyprlauncher/v0.1.6";
    hyprlauncher.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
      hyprwire.follows = "hyprwire";
    };

    hyprlock.url = "github:hyprwm/hyprlock/v0.9.6";
    hyprlock.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpaper.url = "github:hyprwm/hyprpaper/v0.8.4";
    hyprpaper.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
      hyprwire.follows = "hyprwire";
    };

    hyprpicker.url = "github:hyprwm/hyprpicker/v0.4.7";
    hyprpicker.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent/v0.1.3";
    hyprpolkitagent.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-qt-support.follows = "hyprland-qt-support";
      hyprutils.follows = "hyprutils";
    };

    hyprpwcenter.url = "github:hyprwm/hyprpwcenter/v0.1.2";
    hyprpwcenter.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
    };

    hyprshutdown.url = "github:hyprwm/hyprshutdown/v0.1.1";
    hyprshutdown.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
    };

    hyprsunset.url = "github:hyprwm/hyprsunset/v0.4.0";
    hyprsunset.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprtoolkit.url = "github:hyprwm/hyprtoolkit/v0.5.4";
    hyprtoolkit.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprutils.url = "github:hyprwm/hyprutils/v0.14.0";
    hyprutils.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprwayland-scanner.url = "github:hyprwm/hyprwayland-scanner/v0.4.6";
    hyprwayland-scanner.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprwire.url = "github:hyprwm/hyprwire/v0.3.1";
    hyprwire.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
    };

    xdph.url = "github:hyprwm/xdg-desktop-portal-hyprland/v1.4.0";
    xdph.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      systems = import inputs.systems;
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f {
            inherit system;
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      packages = forAllSystems (
        { system, ... }: {
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

      formatter = forAllSystems ({ pkgs, ... }: pkgs.nixfmt-tree);

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
