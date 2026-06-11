{
  description = "My NixOS flake configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
  };

  outputs = (inputs@{ flake-parts, ... }: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          hp-pavilion = inputs.nixpkgs-stable.lib.nixosSystem {
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
  );
}
