{
  inputs,
  self,
  ...
}: {
  imports =
    builtins.attrValues self.homeModules
    ++ [
      ./shells
      ./packages.nix
      ./zed.nix
      inputs.catppuccin.homeModules.default
    ];
  catppuccin = {
    flavor = "macchiato";
    accent = "lavender";
  };

  home = {
    username = "cinnamon";
    homeDirectory = "/home/cinnamon";
    stateVersion = "25.05";
  };

  # Auto manage services on switch
  systemd.user.startServices = "sd-switch";
}
