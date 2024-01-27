{ userSettings, config, lib, pkgs, ... }:

{
	programs = {
		pywal= {
			enable = true;
		};

                      # nixvim.path = "/home/chad/.cache/wal/nixvim.lua";
                      nixvim.extraConfigVim = ''
	 luafile /home/chad/.cache/wal/nixvim.lua
                      '';
	foot.settings.main = {
	include="~/.cache/wal/foot";
		};
	};
	wayland.windowManager.hyprland.extraConfig = ''
		source = /home/chad/.cache/wal/hyprland
	'';


	home.file.".config/wal/templates" = {
		recursive = true;
		source = ./template;
	};

}
