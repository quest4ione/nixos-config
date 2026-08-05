{ self, inputs, ... }: {
  flake.nixosConfigurations.hpPavilion = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hpPavilionConfiguration
    ];
  };
}
