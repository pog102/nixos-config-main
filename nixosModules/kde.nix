{ config, lib, pkgs, ... }:
{
  options = {
    kde.enable = lib.mkEnableOption "enable kde file";
  };
  config = lib.mkIf config.kde.enable {
    cpu.enable = lib.mkForce false;
    services.xserver.desktopManager.plasma6.enable = true;
    services.xserver.displayManager.defaultSession = "plasma";
    home-manager.users."chad".programs.zsh.profileExtra = "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startplasma-wayland; fi";
  };
}

