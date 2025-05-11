{inputs, ...}: {
  imports = with inputs; [
    sherlock.homeModules.default
  ];

  programs.sherlock = {
    enable = true;
  };
}
