{ config, pkgs, ... }:
{
services.logind.extraConfig = ''
    IdleAction=hybrid-sleep
    IdleActionSec=10
  '';
}

