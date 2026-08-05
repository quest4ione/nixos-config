top@{ config, lib, inputs, moduleWithSystem, ... }: {
  perSystem = { config, pkgs, ... }: {
    packages.zellij = pkgs.zellij; # TODO: wrap using wrapper-modules (not supported atm)
  };

  flake = {
    homeModules.zellij = moduleWithSystem (
      perSystem@{ config, ... }:
        home@{ config, ... }: {
          home.packages = [ perSystem.config.packages.zellij ];
        }
    );
  };
}
