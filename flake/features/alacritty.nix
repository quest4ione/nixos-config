{ lib, inputs, ... }: {
  perSystem = { self', pkgs, ... }: {
    packages.alacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;

      settings = {
        window = {
          decorations = "None";
        };

        terminal = {
          # shell = { program = lib.getExe self'.packages.zellij; };
        };
      };
    };
  };
}
