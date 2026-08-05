{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
    };
  };

  flake.nixosModules.noctalia-shell = { ... }: {
    services.upower.enable = true;
  };
}
