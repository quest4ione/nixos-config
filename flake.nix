{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
  };

  outputs = { nixpkgs-stable, nixpkgs-unstable, ... }@inputs: {
    nixosConfigurations = {
      hp-pavilion = nixpkgs-stable.lib.nixosSystem {
        modules = [
          ./hosts/hp-pavilion
        ];

        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
