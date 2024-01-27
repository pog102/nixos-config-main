{ userSettings, config, lib, pkgs, ... }:

{
	programs = {
		pywal= {
			enable = true;
		};

	 nixvim.extraConfigLua = ''
	 require("~/.cache/wal/nixvim.lua")
	 '';

	foot.settings.main = {
	include="~/.cache/wal/foot";
		};
	};
	wayland.windowManager.hyprland.extraConfig = ''
		source = ~/.cache/wal/hyprland
	'';


	home.file.".config/wal/templates" = {
		recursive = true;
		source = ./template;
	};

}
