{ config, pkgs, lib, ... }:
{
  imports = [
    ./nvidia/nvidia.nix
    ./transmission.nix
    ./cpu.nix
    ./steam.nix
    ./jellyfin/jellyfin.nix
  ];
  # pywal.enable = lib.mkDefault true;
  # hyprland.enable = lib.mkDefault true;
  # nvim.enable = lib.mkDefault true;
  # nyaa.enable = lib.mkDefault true;
  # transg.enable = lib.mkDefault true;
  # zsh.enable = lib.mkDefault true;
  # waybar.enable = lib.mkDefault true;
  # git.enable = lib.mkDefault true;
  # dunst.enable = lib.mkDefault true;
  # neofetch.enable = lib.mkDefault true;
  # foot.enable = lib.mkDefault true;
  # lf.enable = lib.mkDefault true;
  # wlsunset.enable = lib.mkDefault true;
  # mpv.enable = lib.mkDefault true;
  # rofi.enable = lib.mkDefault true;
  # cursor.enable = lib.mkDefault false;
  # firefox.enable = lib.mkDefault true;
  # wallpaper.enable = lib.mkDefault true;
}

