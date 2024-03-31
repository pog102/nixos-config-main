{ lib, config, pkgs, ... }:
{
  options = {
    steam.enable = lib.mkEnableOption "enable steam file";
  };
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

}

