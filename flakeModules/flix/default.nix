top@{ inputs, ... }: {
  perSystem = { pkgs, config, ... }:
    let
      jdk = config.devenv.shells.default.languages.java.jdk.package;
      flix = pkgs.writeShellScriptBin "flix" ''
        		${jdk}/bin/java -jar ${inputs.flix-jar} $@
        		'';
    in
    {
      packages = { inherit flix; };
    };
}
