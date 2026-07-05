{ self, inputs, ... }: {
  perSystem = { pkgs, lib, ... }: {
    packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
    };
  };
}
