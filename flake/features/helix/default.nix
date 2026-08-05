{ moduleWithSystem, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.helix = inputs.wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;

      settings = {
        theme = "amberwood";

        editor = {
          line-number = "relative";
          bufferline = "multiple";

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          file-picker = {
            hidden = false;
          };
        };

        keys = {
          normal.space.l = ":lsp-workspace-command";
          # i promise this was useful once when i fucked smth up
          insert.C-c = "normal_mode";
        };
      };
    };
  };

  flake = {
    homeModules.helix = moduleWithSystem ({ self', ... }:
      { ... }: {
        programs.helix = {
          enable = true;
          package = self'.packages.helix;
        };
      }
    );

    nixosModules.helix = moduleWithSystem ({ self', ... }:
      { ... }: {
        environment.systemPackages = [ self'.packages.helix ];
      }
    );
  };
}
