{inputs, ...}: {
  imports = [inputs.home-manager.flakeModules.default];
  flake = {
    nixosModules = import ./nixos;
    homeModules = import ./home;
  };
}
