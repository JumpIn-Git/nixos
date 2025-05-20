{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
    settings = {
      cursor_trail = 1;
      confirm_os_window_close = 0;
    };
  };
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    bind = ["$mod, Q, exec, $terminal"];
  };
  catppuccin.kitty.enable = true;
}
