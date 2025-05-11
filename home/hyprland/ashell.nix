{pkgs, ...}: {
  home.packages = [pkgs.ashell];
  xdg.configFile."ashell/config.toml".source = (pkgs.formats.toml {}).generate "config.toml" {
    clipboardCmd = "kitty --class clipse -e 'clipse'";
    modules = {
      left = [
        "workspaces"
        "tray"
      ];
      center = ["windowTitle"];
      right = [
        "systemInfo"
        ["clock" "privacy" "settings"]
      ];
    };
    workspaces = {
      visibilityMode = "monitorSpecific";
      enableWorkspaceFilling = true;
    };
    settings = {
      audioSinksMoreCmd = "pavucontrol -t 3";
      wifiMoreCmd = "nmtui";
    };
    appearance = {
      # Made by deepseek
      backgroundColor = "#24273a";
      primaryColor = "#cad3f5";
      secondaryColor = "#1e2030";
      successColor = "#a6da95";
      dangerColor = "#ed8796";
      textColor = "#cad3f5";
      workspaceColors = ["#8aadf4" "#f5bde6"];
      specialWorkspaceColors = ["#a6da95" "#eed49f"];
    };
  };
  wayland.windowManager.hyprland.settings = {
    exec = ["ashell"];
  };
}
