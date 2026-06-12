{ self, inputs, ... }: {
  flake.nixosModules.grub = { ...}: {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };

      efi.canTouchEfiVariables = true;
    };
  };
}
