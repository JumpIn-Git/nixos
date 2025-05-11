{inputs, ...}: {
  imports = [
    ../modules
    ../overlays
  ];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
    packages = import ../pkgs pkgs;
  };
}
