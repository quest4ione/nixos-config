{
  description = "My NixOS flake configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
  };

  outputs = (inputs@{ flake-parts, ... }: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          hp-pavilion = inputs.nixpkgs.lib.nixosSystem {
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
