{ lib, config, pkgs, ... }:

{
  options = {
    wlsunset.enable = lib.mkEnableOption "enable wlsunset file";
  };
  config = lib.mkIf config.wlsunset.enable {
    services.wlsunset = {
      enable = true;
      latitude = "47.845490";
      longitude = "22.672390";
      temperature.day = 19800;
      #    settings = {
      # 
      #  };
    };
  };
}
