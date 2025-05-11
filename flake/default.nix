{inputs, ...}: {
  imports = [
    ../modules
    ../overlays
    ../pkgs
    inputs.pre-commit.flakeModule
  ];
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;
    pre-commit.settings.hooks = {
      alejandra.enable = true;
      statix.enable = true;
    };
  };
}
