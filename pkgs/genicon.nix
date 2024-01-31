{ config, pkgs, ... }:
let
icon_dir="icons";
in
{


	home.file."${icon_dir}" = {
		recursive = true;
		source = ../pkgs/walcons;
	};
	# home.file."${icon_dir}".text = 
	# 	''
	#
	#
	# 	'';
}
