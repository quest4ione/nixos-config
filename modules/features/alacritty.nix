top@{ config, lib, inputs, ... }: {
  perSystem = { config, pkgs, ... }: {
    packages.alacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;

      settings = {
        window = {
          decorations = "None";
        };

        terminal = {
          shell = { program = lib.getExe config.packages.zellij; };
        };
      };
    };
  };
}
