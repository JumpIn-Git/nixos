{
  services.clipse = {
    enable = true;
    historySize = 1000;
  };
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float,class:(clipse)"
      "size 622 652,class:(clipse)"
    ];
    bind = [
      "$mod, V, exec, kitty --class --clipse -e 'clipse'"
    ];
  };
}
