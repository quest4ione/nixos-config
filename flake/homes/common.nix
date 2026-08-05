{ ... }: {
  flake.homeModules.common = { ... }: {
    programs.home-manager.enable = true;
  };
}
