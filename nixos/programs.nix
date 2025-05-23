{
  pkgs,
  inputs',
  ...
}: {
  programs = {
    virt-manager.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 3d";
      };
      flake = "/etc/nixos";
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
    gamemode.enable = true;
    vim.enable = true;
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services = {
    ratbagd.enable = true;
    flatpak.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-hyprland];
  };
  environment.systemPackages = with pkgs; [
    piper
    warehouse
    inputs'.zen-browser.packages.zen-browser
    usbutils
  ];
}
