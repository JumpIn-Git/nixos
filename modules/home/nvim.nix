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
      lua
      luarocks

      ripgrep
      fd
      python3

      nixd
      alejandra
      shfmt
      lua-language-server
      stylua
    ];
    plugins = with pkgs.vimPlugins; [lazy-nvim];
  };

  xdg.dataFile."nvim/nix" = {
    source = pkgs.linkFarm "lazyPath" (builtins.map (drv: {
        name = lib.getName drv;
        path = drv;
      }) (with pkgs.vimPlugins; [
        LazyVim
        blink-cmp
      ]));
    recursive = true;
  };
  home.activation.nvim = lib.mkAfter ''
    run rm -rf ${config.xdg.configHome}/nvim
    run ln -sf \
      /etc/nixos/nvim \
      ${config.xdg.configHome}/nvim
  '';
}
