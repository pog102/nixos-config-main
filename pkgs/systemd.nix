{ config, pkgs, ... }:
{
	  boot.kernelParams = [ "mem_sleep_default=deep" ];
services.logind.extraConfig = ''
    # IdleAction=hybrid-sleep
    IdleAction=sleep
    IdleActionSec=10
  '';
}

