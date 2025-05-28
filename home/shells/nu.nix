{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      units
      skim
    ];
    extraConfig = "microfetch";
  };
}
