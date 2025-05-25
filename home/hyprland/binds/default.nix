{lib, ...}: {
  imports = [
    ./media.nix
    ./windows.nix
    ./workspaces.nix
  ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, C, killactive"
      "$mod, F, togglefloating"
      "$mod, J, togglesplit"
    ];
  };
}
