{ config, pkgs, ... }:
{
programs.rofi = {
enable= true;

};

	home.file.".config/rofi/themes/color.rasi".source = {

		recursive = true;
		source = ./themes/launch2.rasi;
	}; 


}

