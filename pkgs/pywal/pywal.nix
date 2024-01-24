{ userSettings, config, lib, pkgs, ... }:

{
	programs = {
		pywal= {
			enable = true;
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
