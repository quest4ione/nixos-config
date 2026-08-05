{ self, ... }: {
  flake.homeModules.questConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.helix
      self.homeModules.zellij
    ];

    home = {
      username = "quest";
      homeDirectory = "/home/quest";
      stateVersion = "26.05";
    };

    programs = {
      home-manager.enable = true;
      vscode.enable = true;
    };

    home.packages = [
      pkgs.discord
      pkgs.prismlauncher
      pkgs.osu-lazer-bin
      pkgs.libreoffice
      pkgs.unzip
    ];
  };
}
