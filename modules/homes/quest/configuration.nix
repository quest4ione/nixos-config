{ self, inputs, ... }: {
  flake.homeModules.questConfiguration = { pkgs, ... }: {
    home = {
      username = "quest";
      homeDirectory = "/home/quest";
      stateVersion = "26.05";
    };

    programs = {
      home-manager.enable = true;
      thunderbird.enable = true;
    };

    home.packages = with pkgs; [
      discord
      spotify-player
      prismlauncher
      osu-lazer-bin
      libreoffice
      numbat
      aseprite
      unzip
    ];
  };
}
