{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      binds = builtins.concatLists (
        builtins.genLists (i: let
          ws = toString (i + 1);
        in [
          "$mod, ${ws}, workspace, ${ws}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
          "$mod CTRL, ${ws}, exec, ${
            pkgs.writers.writeNu "moveTo${ws}" ''
              let workspace = hyprctl activeworkspace -j | from json | get id;
              let windows = hyprctl clients -j | from json
              | where workspace.id == $workspace;

              for window in $windows {
                hyprctl dispatch movetoworkspacesilent $"${ws}, address:($window.address)";
              }
            ''
          }"
        ])
        9
      );
    };
  };
}
