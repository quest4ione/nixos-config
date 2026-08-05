{ ... }: {
  flake.homeModules.prism-launcher = { pkgs, ... }: {
    home.packages = [ pkgs.prismlauncher ];
  };
}
