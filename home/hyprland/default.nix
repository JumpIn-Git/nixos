{pkgs, ...}: {
  imports = [
    ./ashell.nix
    ./clipse.nix
    ./kitty.nix
    ./waytrogen.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      binds = builtins.concatLists (builtins.genLists (
          i: let
            ws = toString (i + 1);
          in [
            "$mod, ${ws}, workspace, ${ws}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
            "$mod CTRL, ${ws}, exec, ${pkgs.writers.writeNuBin "moveTo${ws}" ''
              let state = hyprctl clients -j | from json;
              let windows = $state | where workspace.id == ${ws};

              for window in $windows {
                hyprctl dispath movetoworkspacesilent $"${ws},address:($window.adress)"
              }
            ''}"
          ]
        )
        9);
    };
  };
}
