{ self, inputs, ... }: {
  flake.homeConfigurations.quest = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [
      self.homeModules.questConfiguration
    ];
  };
}
