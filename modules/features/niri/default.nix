{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };

    # TODO: add as a dep to noctalia-shell
    services.upower.enable = true;
  };

  perSystem = { pkgs, lib, self', ... }: {
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
            "Mod+N".spawn = lib.getExe pkgs.alacritty;
            "Mod+B".spawn = lib.getExe pkgs.firefox;
          };
        };
      }
    );
  };
}
