{pkgs, ...}: {
  home.packages = with pkgs; [
    waytrogen
    swaybg
  ];
  wayland.windowManager.hyprland.settings = {
    exec-once = ["waytrogen --restore"]; # TODO: should this be exec
    keybinds = [
      "$mod, W, exec, waytrogen"
    ];
  };
}
