{
  inputs,
  pkgs,
  ...
} @ args: {
  imports = with inputs; [
    nixos-hardware.nixosModules.lenovo-thinkpad-l14-amd
    home-manager.nixosModules.default
  ];

  time.timeZone = "Europe/Amsterdam";

  home-manager = {
    extraSpecialArgs = {
      inherit (args) inputs inputs' self self';
    };
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    users.cinnamon = import ../home/home.nix;
  };

  users.users = {
    cinnamon = {
      isNormalUser = true;
      initialPassword = "horsey";
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.fish;
    };
  };
  security.sudo.wheelNeedsPassword = false;
}
