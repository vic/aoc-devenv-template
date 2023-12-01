top@{ ... }: {
  imports = [ ./flix ];

  perSystem = { pkgs, config, ... }: {
    devenv.shells.default = {
      # See https://devenv.sh/packages/
      packages = with pkgs; [
        jq
        helix
        aoc-cli
        flix
        watchexec
        just
      ];

      # See https://devenv.sh/languages/
      languages.rust.enable = true;
      languages.zig.enable = true;
      languages.scala.enable = true;
      #languages.ocaml.enable = true;
      languages.unison.enable = true;

      languages.java.jdk.package = pkgs.graalvm-ce;
      languages.ocaml.packages = pkgs.ocaml-ng.ocamlPackages_5_1;
    };

  };
}
