{ self, inputs, ... }: {
  flake.nixosModules.hpPavilionConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.hpPavilionHardware
      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.users = {
          quest = self.homeModules.questConfiguration;
        };
      }
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "hp-pavilion";
    networking.networkmanager.enable = true;

    hardware.bluetooth.enable = true;
    hardware.enableAllFirmware = true;

    time.timeZone = "Europe/Amsterdam";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };

    fonts = {
      packages = with pkgs; [
        nerd-fonts.iosevka-term
      ];
    };

    services.displayManager.ly.enable = true;

    programs.hyprland = {
      enable = true;
    };

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

    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
            };
          };
        };
      };
    };

    programs.gamescope.enable = true;
    programs.steam = {
      enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };

    programs.firefox.enable = true;

    programs.waybar.enable = true;

    environment = {
      systemPackages = with pkgs; [
        # required apps for system usage
        wget
        helix
        git
        alacritty
        # wayland
        wl-clipboard
        # hyperland
        pkgs.hyprpolkitagent
        pkgs.hyprland-qt-support
        pkgs.hyprlauncher
        pkgs.xdg-desktop-portal-hyprland
        pkgs.hyprnotify
        pkgs.hyprshutdown
        # i/o stuffs
        playerctl
        bluetui
        wiremix
        # notifs
        libnotify
      ];
      variables = {
        VISUAL = "hx";
      };
    };

    users.users.quest = {
      isNormalUser = true;
      description = "quest";
      extraGroups = [ "networkmanager" "wheel" ];
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
