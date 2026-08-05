{ moduleWithSystem, ... }: {
  perSystem = { pkgs, ... }: {
    packages.zellij = pkgs.zellij; # TODO: wrap using wrapper-modules (not supported atm)
  };

  flake = {
    homeModules.zellij = moduleWithSystem ({ self', ... }:
      { ... }: {
        home.packages = [ self'.packages.zellij ];
      }
    );
  };
}
