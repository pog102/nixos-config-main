{ config, pkgs, ... }:
{
services.udev.extraRules = ''
    SUBSYSTEM=="drm", ACTION=="change", DEVNAME=="/dev/dri/card1", \
RUN+="/nix/store/p0shycl32xg6nyyaz7b0yv0qfmnksg1q-user-environment/bin/hyprctl keyword monitor eDP-1,disable"
  '';

}

