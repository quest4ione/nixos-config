{ self, ... }: {
  flake.homeModules.questConfiguration = { pkgs, ... }: {
    home = {
      username = "quest";
      homeDirectory = "/home/quest";
      stateVersion = "26.05";
    };

    imports = [
      self.homeModules.common

      self.homeModules.helix
      # self.homeModules.zellij
      self.homeModules.discord
      self.homeModules.prism-launcher
      self.homeModules.osu-lazer
      self.homeModules.libre-office
      self.homeModules.vscode
    ];
  };
}
