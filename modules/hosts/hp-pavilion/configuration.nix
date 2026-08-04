{ self, inputs, ... }: {
  flake.nixosModules.hpPavilionConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.hpPavilionHardware
      self.nixosModules.grub
      self.nixosModules.steam
      self.nixosModules.locale
      self.nixosModules.hyprland
      self.nixosModules.capsEsc
      self.nixosModules.helix
      self.nixosModules.printing

      self.nixosModules.niri

      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.users = {
          quest = self.homeModules.questConfiguration;
        };
      }
    ];

    services.desktopManager.plasma6.enable = true;

    networking.hostName = "hp-pavilion";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    users.users.quest = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    networking.networkmanager.enable = true;

    hardware.bluetooth.enable = true;
    hardware.enableAllFirmware = true;

    fonts = {
      packages = with pkgs; [
        nerd-fonts.iosevka-term
      ];
    };

    services.displayManager.ly.enable = true;

    # audio
    security.rtkit.enable = true; # used by pipewire
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # search.nixos.org says this is disabled by default...
    services.power-profiles-daemon.enable = false;

    # my laptop crashes a lot otherwise, not sure if this is the best fix :p
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        turbo = "never";
      };
      charger = {
        turbo = "never";
      };
    };

    services.flatpak.enable = true;

    programs.firefox.enable = true;

    environment = {
      systemPackages = with pkgs; [
        # required apps for system usage
        wget
        git
        alacritty
        # i/o stuffs
        playerctl
        bluetui
        wiremix
      ];
      variables = {
        VISUAL = "hx";
      };
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
