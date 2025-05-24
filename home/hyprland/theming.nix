{pkgs, ...}: {
  catppuccin.gtk.enable = true;
  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
  };
}
