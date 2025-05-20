{inputs, ...}: {
  imports = [
    inputs.home-manager.flakeModules.default
    ./home
    ./nixos
  ];
}
