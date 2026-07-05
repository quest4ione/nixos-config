{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ...}: {
    programs = {
      hyprland.enable = true;
    };

    environment.systemPackages = [
      pkgs.wl-clipboard
      pkgs.hyprpolkitagent
      pkgs.hyprland-qt-support
      pkgs.hyprlauncher
      pkgs.xdg-desktop-portal-hyprland
      pkgs.hyprnotify
      pkgs.hyprshutdown
      pkgs.libnotify
    ];
  };
}
