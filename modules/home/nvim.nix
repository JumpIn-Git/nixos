{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      gcc
      git

      ripgrep
      fd
      lazygit

      nixd
      alejandra
      shfmt
      lua-language-server
      stylua
    ];
  };

  xdg.dataFile."nvim/nix" = {
    source = pkgs.linkFarm "lazyPath" (builtins.map (p: {
        name = lib.getName p;
        path = p;
      }) (with pkgs.vimPlugins; [
        blink-cmp
        # For now, only blink is needed (prebuilt binaries)
      ]));
    recursive = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/nvim";
  # home.activation.nvim = lib.mkAfter ''
  #   run rm -rf ${config.xdg.configHome}/nvim
  #   run ln -sf \
  #     /etc/nixos/home/nvim \
  #     ${config.xdg.configHome}/nvim
  # '';
}
