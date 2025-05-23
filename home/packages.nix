{
  pkgs,
  inputs',
  self',
  ...
}: {
  home.packages = with pkgs; [
    whatsie
    obsidian
    pandoc
    stremio

    hydralauncher
    heroic
    inputs'.olympus.legacyPackages.olympus

    cachix
    unar
    dust
    undollar
    nix-inspect
    fd
    ripgrep
    self'.packages.diskonaut
  ];
  programs = {
    lazygit.enable = true;
    btop.enable = true;
  };
  catppuccin = {
    lazygit.enable = true;
    btop.enable = true;
  };
}
