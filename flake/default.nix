{inputs, ...}: {
  imports = [
    ../modules
    ../overlays
  ];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
    packages = import ../pkgs pkgs;
    checks = {
      alejandra = pkgs.runCommand "alejandra" {nativeBuildInputs = [pkgs.alejandra];} ''
        alejandra --check ${inputs.self} < /dev/null |& tee $out
      '';
    };
  };
}
