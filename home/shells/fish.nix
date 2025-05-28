{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins =
      builtins.map (p: {
        name = p.pname;
        src = p;
      }) (with pkgs.fishPlugins; [
        puffer
        autopair
        fzf-fish
        done
        (pure.overrideAttrs {
          nativeCheckInputs = [];
          checkPlugins = [];
          checkPhase = "";
        })
      ]);
    interactiveShellInit = ''
      set pure_enable_nix_devshell true
      set pure_seperate_prompt_on_error true
      set pure_show_prefix_root_prompt true
      microfetch
    '';
  };
}
