{ lib, ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        user = {
          email = "quest4ione@gmail.com";
          name = "quest4ione";
        };
      };
    };
  };
}
