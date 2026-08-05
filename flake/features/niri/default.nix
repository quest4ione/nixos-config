{ lib, moduleWithSystem, inputs, ... }: {
  flake.nixosModules.niri = moduleWithSystem ({ self', ... }:
    { ... }: {
      programs.niri = {
        enable = true;
        package = self'.packages.niri;
      };
    }
  );

  perSystem = { self', pkgs, ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap (
      let
          qs = lib.getExe pkgs.noctalia-qs;
          noctalia-shell-qml = "${pkgs.noctalia-shell}/share/noctalia-shell/shell.qml";
      in {
        inherit pkgs;

        settings = {
          include = ./config.kdl;
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
          spawn-at-startup = [
            [qs "-p" noctalia-shell-qml]
          ];
          binds = {
            "Mod+Space".spawn = [
                qs
                "-p"              
                noctalia-shell-qml
                "ipc"
                "call"
                "launcher"
                "toggle"
            ];
            "Mod+N".spawn = lib.getExe self'.packages.alacritty;
            "Mod+B".spawn = lib.getExe pkgs.firefox;
          };
        };
      }
    );
  };
}
