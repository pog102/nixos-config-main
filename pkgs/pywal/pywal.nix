{ userSettings, config, lib, pkgs, ... }:

{
	programs = {
	
    starship.enable = true;
   zsh.initExtra = ''
    export STARSHIP_CONFIG="/home/chad/.cache/wal/starship";
   '';

		pywal= {
			enable = true;
		};
nixvim ={
extraConfigVim = ''
colorscheme pywal
'';
	  extraPlugins = with pkgs.vimPlugins; [
pywal-nvim
# comment-nvim
# {
# plugin =skel-nvim;
# # config = 
# }
	  ];



};
                      # nixvim.path = "/home/chad/.cache/wal/nixvim.lua";
       #               nixvim.extraConfigVim = ''
#	 luafile /home/chad/.cache/wal/nixvim.lua
 #                     '';
	foot.settings.main = {
	include="~/.cache/wal/foot";
		};
	};
	wayland.windowManager.hyprland.extraConfig = ''
		source = /home/chad/.cache/wal/hyprland
	'';

programs.rofi = {
theme=lib.mkForce "~/.cache/wal/colors.rasi";
};
services.dunst = {
enable=true;
configFile="/home/chad/.cache/wal/dunstrc";
};


	home.file.".config/wal/templates" = {
		recursive = true;
		source = ./template;
	};

	# home.sessionVariables = {
 #   STARSHIP_CONFIG="/home/chad/.cache/wal/starship";
	# };
}
