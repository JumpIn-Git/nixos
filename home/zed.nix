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
        options = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.jump1n.options";
      in {
        options = {
          nixos.expr = options;
          home-manager = "${options}.home-manager.users.type.getSubOptions []";
        };
      };
    };
  };

  catppuccin.zed.enable = true;
}
