{
  description = "Hypr* ecosystem stable release flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    aquamarine.url = "github:hyprwm/aquamarine/v0.15.1";
    aquamarine.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprcursor.url = "github:hyprwm/hyprcursor/e4ed7c08123df5af460a0a70961380cbfb872f76";
    hyprcursor.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprlang.follows = "hyprlang";
    };

    hyprgraphics.url = "github:hyprwm/hyprgraphics/344aff614cddd4b2286315e122a81e4f79e1282a";
    hyprgraphics.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
    };

    hypridle.url = "github:hyprwm/hypridle/aa958ed7ad4863860b93ecd7189419e193bfae2c";
    hypridle.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland.url = "github:hyprwm/hyprland/v0.56.2";
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

    hyprland-guiutils.url = "github:hyprwm/hyprland-guiutils/4c30cf3097ea963c0e250749ee0c59f8b08816d6";
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

    hyprland-protocols.url = "github:hyprwm/hyprland-protocols/v0.7.1";
    hyprland-protocols.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprland-qt-support.url = "github:hyprwm/hyprland-qt-support/v0.1.0";
    hyprland-qt-support.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprlang.url = "github:hyprwm/hyprlang/9508458be316a0d70d37ebed1ab725ccd10411ff";
    hyprlang.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
    };

    hyprlauncher.url = "github:hyprwm/hyprlauncher/487fd4b174fd795f5dba3fdaa2b059eca1bcf7f7";
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

    hyprlock.url = "github:hyprwm/hyprlock/0332e40b8e56404f11cd79f859f208a4b9de8714";
    hyprlock.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpaper.url = "github:hyprwm/hyprpaper/6a3bf6912c384a73740db4f734f1573ecc007c0e";
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

    hyprpicker.url = "github:hyprwm/hyprpicker/dcc3f87d840433f74cfb3f836efe9fc6a73e361c";
    hyprpicker.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent/v0.2.0";
    hyprpolkitagent.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
    };

    hyprpwcenter.url = "github:hyprwm/hyprpwcenter/c31c45734f8e9e9f85fc3a42a52ea896e515e9e4";
    hyprpwcenter.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
    };

    hyprshutdown.url = "github:hyprwm/hyprshutdown/2d011c4a3dfb990004450e785608e91635f3d146";
    hyprshutdown.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprtoolkit.follows = "hyprtoolkit";
      hyprutils.follows = "hyprutils";
    };

    hyprsunset.url = "github:hyprwm/hyprsunset/471b385fb772beaaf57460d4fea8deba3f94b65f";
    hyprsunset.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      hyprland-protocols.follows = "hyprland-protocols";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprtoolkit.url = "github:hyprwm/hyprtoolkit/v0.6.0";
    hyprtoolkit.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
      aquamarine.follows = "aquamarine";
      hyprgraphics.follows = "hyprgraphics";
      hyprlang.follows = "hyprlang";
      hyprutils.follows = "hyprutils";
      hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprutils.url = "github:hyprwm/hyprutils/v0.14.2";
    hyprutils.inputs = {
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };

    hyprwayland-scanner.url = "github:hyprwm/hyprwayland-scanner/62e62c1ca23da17612c6890d4ad2064f575643db";
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

    xdph.url = "github:hyprwm/xdg-desktop-portal-hyprland/9f0e9ff02739cd538d39bd706422dc50e9ca60dd";
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
            pkgs = import nixpkgs {
              inherit system;
              overlays = [ self.overlays.default ];
            };
          }
        );
    in
    {
      packages = forAllSystems (
        {
          system,
          pkgs,
          ...
        }:
        {
          default = pkgs.hyprland.override { inherit (pkgs) glaze-hyprland; };
          inherit (pkgs)
            aquamarine
            hyprcursor
            hyprgraphics
            hypridle
            hyprland-guiutils
            hyprland
            hyprland-protocols
            hyprland-qt-support
            hyprlang
            hyprlauncher
            hyprlock
            hyprpaper
            hyprpicker
            hyprpolkitagent
            hyprpwcenter
            hyprshutdown
            hyprsunset
            hyprtoolkit
            hyprutils
            hyprwayland-scanner
            hyprwire
            xdg-desktop-portal-hyprland
            ;
        }
      );

      formatter = forAllSystems ({ pkgs, ... }: pkgs.nixfmt-tree);

      checks = self.packages;

      overlays = {
        default = nixpkgs.lib.composeManyExtensions [
          self.overlays.hyprland
          self.overlays.glaze
        ];

        hyprland = nixpkgs.lib.composeManyExtensions [
          inputs.hyprland.overlays.default
          inputs.hypridle.overlays.default
          inputs.hyprlauncher.overlays.default
          inputs.hyprlock.overlays.default
          inputs.hyprpaper.overlays.default
          inputs.hyprpicker.overlays.default
          inputs.hyprpolkitagent.overlays.default
          inputs.hyprpwcenter.overlays.default
          inputs.hyprshutdown.overlays.default
          inputs.hyprsunset.overlays.default

          # Libraries
          inputs.hyprland-guiutils.overlays.default # depends aquamarine, graphics, lang, utils, toolkit, w-s
          inputs.hyprtoolkit.overlays.default # depends aquamarine, graphics, lang, utils, w-s
          inputs.xdph.overlays.default # depends lang, protocols, utils, w-s
          inputs.hyprcursor.overlays.default # depends lang
          inputs.hyprland-qt-support.overlays.default # depends lang
          inputs.aquamarine.overlays.default # depends utils, w-s
          inputs.hyprgraphics.overlays.default # depends utils
          inputs.hyprlang.overlays.default # depends utils
          inputs.hyprwire.overlays.default # depends utils
          inputs.hyprwayland-scanner.overlays.default # No deps
          inputs.hyprutils.overlays.default # No deps
          inputs.hyprland-protocols.overlays.default # No deps
        ];

        # TODO: remove when 0.57 is released
        glaze = final: prev: {
          glaze-hyprland = prev.glaze-hyprland.overrideAttrs {
            version = "7.9.1"; # satisfies Hyprland's `find_package(glaze 7...<8)`
            src = prev.fetchFromGitHub {
              owner = "stephenberry";
              repo = "glaze";
              rev = "v7.9.1";
              hash = "sha256-NRRq5MGF2f5PW0teYnq58ELzson+U6KHVPaY6r30KLA=";
            };
          };
          hyprland = prev.hyprland.override { inherit (final) glaze-hyprland; };
        };
      };
    };
}
