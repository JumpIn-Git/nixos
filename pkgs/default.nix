{
  perSystem = {pkgs, ...}: {
    packages = {
      diskonaut = pkgs.callPackage ./diskonaut.nix {};
    };
  };
}
