{pkgs, ...}: {
  imports = [./fish.nix ./nu.nix];
  programs = {
    bat.enable = true;
    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
    eza = {
      enable = true;
      icons = "auto";
      colors = "auto";
    };
    nix-your-shell.enable = true;
    pay-respects.enable = true;
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    carapace.enable = true;
  };

  home = {
    shell = {
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    shellAliases = {
      cat = "bat";
      df = "duf";
    };
    packages = with pkgs; [microfetch duf];
  };
  catppuccin = {
    fish.enable = true;
    nushell.enable = true;
    bat.enable = true;
    fzf.enable = true;
  };
}
