{inputs, ...}: {
  imports = [
    ../modules
    ../overlays
    inputs.pre-commit.flakeModule
  ];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
    packages = import ../pkgs pkgs;
    pre-commit.settings.hooks = {
      alejandra.enable = true;
      statix.enable = true;
    };
  };
}
