{ ... }: {
  flake.nixosModules.common = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = [
      pkgs.wget
      pkgs.git
      pkgs.unzip
    ];
  };
}
