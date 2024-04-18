{ lib, config, pkgs, ... }:
{
  options = {
    rofi.enable = lib.mkEnableOption "enable rofi file";
  };
  config = lib.mkIf config.rofi.enable {
    # programs.rofi = {
    # enable= true;
    # terminal="foot";
    # # package=pkgs.rofi.override { plugins = [ pkgs.rofi-wayland]; };
    # }; # no package for home-manger :(

    home.packages = [
      pkgs.rofi-wayland
      # pkgs.rofi-wayland-unwrapped
    ];

    home.file.".local/share/fonts" = {
      recursive = true;
      source = ../fonts;
    };
    home.file.".config/rofi/themes" = {

      recursive = true;
      source = ./themes;
    };

  };
}

