{
  imports = [
    ./binds

    ./ashell.nix
    ./clipse.nix
    ./kitty.nix
    ./waytrogen.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    # Hyprland is installed by nixos
    settings = {
      "$mod" = "SUPER";
    };
  };
}
