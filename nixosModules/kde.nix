{ config, lib, pkgs, ... }:
{
  options = {
    kde.enable = lib.mkEnableOption "enable kde file";
  };
  config = lib.mkIf config.kde.enable {
    cpu.enable = false 100;
    services.xserver.desktopManager.plasma6.enable = true;
    services.xserver.displayManager.defaultSession = "plasma";
    zsh.profileExtra = "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startplasma-wayland; fi";
  };
}

