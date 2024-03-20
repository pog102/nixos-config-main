{ config, pkgs, ... }:
{

home.packages = pkgs.(pkgs.callPackage ./default.nix { });
	# home.file."Pictures" = {
	# 	recursive = true;
	# 	# source = ../../wallpapers/${userSettings.theme};
	# };


}

