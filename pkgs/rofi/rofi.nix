{ config, pkgs, ... }:
{
# programs.rofi = {
# enable= true;
# terminal="foot";
# # package=pkgs.rofi.override { plugins = [ pkgs.rofi-wayland]; };
# }; # no package for home-manger :(

	home.packages = [
	pkgs.rofi-wayland
	];
	home.file.".config/rofi/themes" = {

		recursive = true;
		source = ./themes;
	}; 


}

