{
  description = "jump1n's Os";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-small.url = "github:nixos/nixpkgs?ref=nixos-unstable-small";
    olympus.url = "github:petingoso/nixpkgs?ref=olympus";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sherlock = {
      url = "github:skxxtz/sherlock";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "parts";
        home-manager.follows = "";
      };
    };

    nixos-hardware.url = "github:nixos/nixos-hardware";
    systems.url = "github:nix-systems/default";
    parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    parts,
    systems,
    nixpkgs,
    self,
    ...
  } @ inputs:
    parts.lib.mkFlake {inherit inputs;} ({withSystem, ...}: {
      systems = import systems;
      imports = [./flake];
      flake = {
        nixosConfigurations.jump1n = withSystem "x86_64-linux" ({
          inputs',
          self',
          ...
        }:
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs inputs' self self';
            };
            modules = [./nixos/config.nix];
          });
      };
    });
}
