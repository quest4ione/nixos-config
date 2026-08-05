{ ... }: {
  flake.nixosModules.capsEsc = { ... }: {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
            };
          };
        };
      };
    };
  };
}
