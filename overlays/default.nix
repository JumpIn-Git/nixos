{inputs, ...}: {
  flake.overlays = {
    additons = final: _prev: import ../pkgs final.pkgs;
    small = final: _prev: {
      small = import inputs.nixpkgs-small {
        inherit (final) system config;
      };
    };

    olympus = final: _prev: {
      inherit (inputs.olympus.legacyPackages.${final.system}) olympus;
    };
  };
}
