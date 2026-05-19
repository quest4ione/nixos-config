{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
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
