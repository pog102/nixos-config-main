{ config, pkgs, lib, ... }:
{
  imports = [

    ./pywal/pywal.nix
    ./wm/hyprland.nix
    # pkgs/kde.nix
    ./editor/nvim.nix
    #gs/batsignal.nix
    ./nyaa/nyaa.nix
    ./trangs-tui/transg.nix
    ./shell/zsh.nix
    ./waybar/waybar.nix
    ./git.nix
    # /pkgs/imv.nix
    ./dunst.nix
    ./neofetch.nix
    ./term/foot.nix
    ./lf.nix
    ./wlsunset.nix
    ./mpv/mpv.nix
    ./rofi/rofi.nix
    #/pkgs/btop.nix
    ./cursor.nix
    #/pkgs/ayurs/ags.nix
    #/pkgs/transg.nix
    ./firefox/firefox.nix
    #  /pkgs/kanshi.nix
    ./wallpaper/wallpaper.nix
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

