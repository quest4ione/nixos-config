{ ... }: {
  flake.nixosModules.network-manager = { pkgs, ... }: {
    networking.networkmanager.enable = true;
  };
}
