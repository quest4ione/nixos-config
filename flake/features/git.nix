{ lib, ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "saturnalcat@proton.me";
          name = "saturnalcat";
        };
      };
    };
  };
}
