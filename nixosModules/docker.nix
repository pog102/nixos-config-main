{ config, lib, pkgs, ... }:
{
  options = {
    docker.enable = lib.mkEnableOption "enable docker file";
  };
  config = lib.mkIf config.docker.enable {

    virtualisation.docker.enable = true;
    users.users.chad.extraGroups = [ "docker" ];
  };
}

