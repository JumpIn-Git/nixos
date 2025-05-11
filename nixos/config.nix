{
  inputs,
  self,
  ...
}: {
  imports = [
    ./hardware.nix
    ./programs.nix
    ./user.nix
  ];

  networking = {
    networkmanager.enable = true;
    hostName = "jump1n";
  };
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  # Include all options in man page
  documentation.nixos.includeAllModules = true;
  nix = {
    channel.enable = false;
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
      trusted-users = ["@wheel"];
    };
  };
  nixpkgs = {
    overlays = builtins.attrValues self.overlays;
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "25.05";
}
