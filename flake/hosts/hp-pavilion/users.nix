{ ... }: {
  flake.nixosModules.hpPavilionConfiguration = { pkgs, ... }: {
    users.users.quest = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
