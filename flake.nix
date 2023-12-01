{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    devenv.url = "github:cachix/devenv";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.devenv.flakeModule ];

      perSystem = { pkgs, config, ... }: {
        devenv.shells.default = {
          # See https://devenv.sh/packages/
          packages = with pkgs; [
            jq
            helix
            aoc-cli
          ];

          # See https://devenv.sh/languages/
          languages.rust.enable = true;
          languages.zig.enable = true;
          ## languages.scala.enable = true;
          ## #languages.ocaml.enable = true;
          ## languages.unison.enable = true;

          ## languages.java.jdk.package = pkgs.graalvm-ce;
          ## languages.ocaml.packages = pkgs.ocaml-ng.ocamlPackages_5_1;
        };

      };
    };
}
