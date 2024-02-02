{ config, pkgs, ... }:
{
programs.rofi = {
enable= true;

};

	home.file.".config/rofi/themes" = {

		recursive = true;
		source = ./themes/launch2.rasi;
	}; 


}

