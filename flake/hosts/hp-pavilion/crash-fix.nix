{ ... }: {
  flake.nixosModules.hpPavilionConfiguration = { ... }: {
    # my laptop crashes a lot otherwise, not sure if this is the best fix :p
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        turbo = "never";
      };
      charger = {
        turbo = "never";
      };
    };
  };
}
