let
  getFlake = p: builtins.getFlake (toString p);
  flake = getFlake ./.;
  nixpkgs = flake.inputs.nixpkgs.legacyPackages.${builtins.currentSystem};
in
  flake
  // {inherit flake;}
  // builtins
  // {inherit getFlake;}
  // nixpkgs
  // nixpkgs.lib
  // rec {
    nixos = flake.nixosConfigurations.jump1n;
    home = nixos.config.home-manager.users.cinnamon;
  }
  // {
    inputTree = inputs:
      builtins.attrNames inputs
      |> builtins.filter (n: inputs.${n}.inputs or {} != {})
      |> builtins.map (
        n: {
          name = n;
          value = builtins.attrNames inputs.${n}.inputs;
        }
      )
      |> builtins.listToAttrs;
  }
