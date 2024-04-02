{ lib, config, pkgs, ... }:
{
  options = {
    cpu.enable = lib.mkEnableOption "enable cpu file";
  };
  config = lib.mkIf config.cpu.enable {
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}

