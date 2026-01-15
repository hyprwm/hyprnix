let
  sources = import ./npins;
  pkgs = import sources.nixpkgs { system = "x86_64-linux"; };
  inherit (pkgs) lib;
  filteredSources = lib.filterAttrs (
    n: _: n != "nixpkgs" && n != "flake-compat" && n != "__functor"
  ) sources;
  flake-compat = import sources.flake-compat;
  pins = builtins.mapAttrs (_: p: p { inherit pkgs; }) filteredSources;
  overlaysList = lib.mapAttrsToList (
    _: v: (flake-compat { src = v; }).defaultNix.overlays.default
  ) pins;
in
{
  default = lib.composeManyExtensions overlaysList;
  inherit
    pins
    flake-compat
    pkgs
    overlaysList
    ;
}
