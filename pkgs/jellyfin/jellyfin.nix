{ lib, config, pkgs, ... }:
{
  options = {
    jellyfin.enable = lib.mkEnableOption "enable jellyfin file";
  };
  config = lib.mkIf config.jellyfin.enable {
    services.jellyfin = {
      dataDir = ./data;
      enable = true;
      openFirewall = true;
      user = "chad";
    };
    environment.systemPackages = [
      pkgs.jellyfin
      pkgs.jellyfin-web
      pkgs.jellyfin-ffmpeg
    ];
  };
}

