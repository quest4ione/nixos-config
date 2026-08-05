{ config, lib, ... }: {
  flake.nixosModules.nix-ld = { config, pkgs, ... }: {
    programs.nix-ld.enable = true;
  };
}
