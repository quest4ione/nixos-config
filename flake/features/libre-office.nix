{ ... }: {
  flake.homeModules.libre-office = { pkgs, ... }: {
    home.packages = [ pkgs.libreoffice ];
  };
}
