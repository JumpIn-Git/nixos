{
  imports = [
    ./workspaces.nix

    ./ashell.nix
    ./clipse.nix
    ./kitty.nix
    ./waytrogen.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
    };
  };
}
