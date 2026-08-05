{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
    };
  };

  flake.homeModules.noctalia-shell = { pkgs, ... }: {
    home.packages = [ pkgs.playerctl ];
  };

  flake.nixosModules.noctalia-shell = { ... }: {
    services.upower.enable = true;
  };
}
