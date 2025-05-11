{pkgs, ...}: {
  home.packages = with pkgs; [
    waytrogen
    swaybg
  ];
  wayland.windowManager.hyprland.settings = {
    exec = ["waytrogen --restore"];
    keybinds = [
      "$mod, W, exec, waytrogen"
    ];
  };
}
