{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "nu" "fish"];
    extraPackages = with pkgs; [alejandra nixd nushell fishMinimal];
    userSettings = {
      vim_mode = true;
      languages.Nix = {
        language_servers = ["nixd" "!nil"];
        formatter.external = {
          command = "alejandra";
          arguments = ["--quiet" "--"];
        };
      };
      lsp.nixd.settings = let
        f = "(builtins.getFlake \"/etc/nixos\")";
      in {
        options = {
          nixos.expr = "${f}.nixosConfigurations.jump1n.options";
        };
      };
    };
  };

  catppuccin.zed.enable = true;
}
