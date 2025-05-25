{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [brightnessctl];
  wayland.windowManager.hyprland.settings = {
    binde = lib.mapAttrsToList (n: v: ", XF86${n}, exec, ${v}") {
      MonBrightnessUp = "brightnessctl s +3%";
      MonBrightnessDown = "brightnessctl s 3%-";
      # TODO:audio (hyprpanel?)
    };
  };
}
