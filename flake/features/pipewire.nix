{ ... }: {
  flake.nixosModules.pipewire = { pkgs, ... }: {
    security.rtkit.enable = true; # used by pipewire
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    environment.systemPackages = [ pkgs.wiremix ];
  };
}
