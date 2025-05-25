{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, U, fullscreen, 0"
      "$mod, M, fullscreen, 1" # hide all other windows
    ];
    binds = builtins.concatLists (lib.mapAttrsToList (n: v: [
        "CTRL, ${v.bind}, movefocus, ${n}"
        "SHIFT, ${v.bind}, resizeactive, ${v.resize}"
        "ALT, ${v.bind}, swapwindow, ${n}"
      ]) {
        l = {
          bind = "left&h";
          resize = "-100 0";
        };
        r = {
          bind = "right&l";
          resize = "100 0";
        };
        u = {
          bind = "up&k";
          resize = "0 -100";
        };
        d = {
          bind = "down&j";
          resize = "0 100";
        };
      });
  };
}
