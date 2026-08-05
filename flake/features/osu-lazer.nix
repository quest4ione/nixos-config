{ ... }: {
  flake.homeModules.osu-lazer = { pkgs, ... }: {
    home.packages = [ pkgs.osu-lazer-bin ];
  };
}
