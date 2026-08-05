{ self, inputs, ... }: {
  flake.nixosModules.hpPavilionConfiguration = { pkgs, ... }: {
    networking.hostName = "hp-pavilion";
    system.stateVersion = "25.11";

    nixpkgs.config.allowUnfree = true;

    environment.variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    imports = [
      self.nixosModules.common
      self.nixosModules.locale

      self.nixosModules.network-manager
      self.nixosModules.pipewire
      self.nixosModules.bluetooth
      self.nixosModules.printing
      self.nixosModules.nix-ld

      self.nixosModules.grub
      self.nixosModules.ly
      self.nixosModules.niri
      self.nixosModules.noctalia-shell

      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.users = {
          quest = self.homeModules.questConfiguration;
        };
      }

      self.nixosModules.capsEsc

      self.nixosModules.docker
      self.nixosModules.flatpak

      self.nixosModules.firefox
      self.nixosModules.steam
      self.nixosModules.helix
    ];
  };
}
