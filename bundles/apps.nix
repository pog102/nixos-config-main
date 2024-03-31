{ config, pkgs, lib, ... }:
{
  imports = [

    # (if userSettings.theme == "wal" then
    ../pkgs/pywal/pywal.nix
    # else
    #   ../../pkgs/color.nix
    # )
    ../pkgs/wm/hyprland.nix
    #../../pkgs/kde.nix
    ../pkgs/editor/nvim.nix
    # ../pkgs/batsignal.nix
    ../pkgs/nyaa/nyaa.nix
    ../pkgs/trangs-tui/transg.nix
    ../pkgs/shell/zsh.nix
    ../pkgs/waybar/waybar.nix
    ../pkgs/git.nix
    # ../../pkgs/imv.nix
    ../pkgs/dunst.nix
    ../pkgs/neofetch.nix
    ../pkgs/term/foot.nix
    ../pkgs/lf.nix
    ../pkgs/wlsunset.nix
    ../pkgs/mpv/mpv.nix
    ../pkgs/rofi/rofi.nix
    # ../../pkgs/btop.nix
    ../pkgs/cursor.nix
    # ../../pkgs/ayurs/ags.nix
    # ../../pkgs/transg.nix
    ../pkgs/firefox/firefox.nix
    # ../../pkgs/kanshi.nix
    ../pkgs/wallpaper/wallpaper.nix
  ];
  pywal.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  nyaa.enable = lib.mkDefault true;
  transg.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  waybar.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  dunst.enable = lib.mkDefault true;
  neofetch.enable = lib.mkDefault true;
  foot.enable = lib.mkDefault true;
  lf.enable = lib.mkDefault true;
  wlsunset.enable = lib.mkDefault true;
  mpv.enable = lib.mkDefault true;
  rofi.enable = lib.mkDefault true;
  cursor.enable = lib.mkDefault false;
  firefox.enable = lib.mkDefault true;
  wallpaper.enable = lib.mkDefault true;
}

