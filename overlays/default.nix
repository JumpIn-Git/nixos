{inputs, ...}: {
  flake.overlays = {
    small = final: _prev: {
      small = import inputs.nixpkgs-small {
        inherit (final) system config;
      };
    };
  };
}
