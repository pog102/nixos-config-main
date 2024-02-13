{ userSettings,lib,inputs,config, pkgs, ... }:
{ 
  imports = [
    inputs.nix-colors.homeManagerModules.default
		../pkgs/starship.nix
		../pkgs/dunst.nix
		../pkgs/genicon.nix

  ];
 # colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  # colorScheme = inputs.nix-colors.colorSchemes."gruvbox-dark-medium";
# colorscheme = inputs.nix-colors.colorschemes.base16.colorscheme."gruvbox-dark-medium";
 colorScheme = inputs.nix-colors.colorSchemes.${userSettings.theme};



# services.dunst = {
# settings = {
#
#
#
# };
# };


		programs.nixvim.colorschemes.base16 = {
            # enable = if userSettings.theme == "wal" then false else true;
            enable =true;
	    customColorScheme={

	base00 = "";
    base01 = "#${config.colorScheme.palette.base01}";
    base02 = "#${config.colorScheme.palette.base02}";
    base03 = "#${config.colorScheme.palette.base03}";
    base04 = "#${config.colorScheme.palette.base04}";
    base05 = "#${config.colorScheme.palette.base05}";
    base06 = "#${config.colorScheme.palette.base06}";
    base07 = "#${config.colorScheme.palette.base07}";
    base08 = "#${config.colorScheme.palette.base08}";
    base09 = "#${config.colorScheme.palette.base09}";
    base0A = "#${config.colorScheme.palette.base0A}";
    base0B = "#${config.colorScheme.palette.base0B}";
    base0C = "#${config.colorScheme.palette.base0C}";
    base0D = "#${config.colorScheme.palette.base0D}";
    base0E = "#${config.colorScheme.palette.base0E}";
    base0F = "#${config.colorScheme.palette.base0F}";

	    };


	    # colorscheme = "${userSettings.theme}";
            setUpBar = true;
            useTruecolor = true;
                      };

programs.rofi = {
theme= "~/.config/rofi/color.rasi";
};
	home.file.".config/rofi/color.rasi".text = ''
* {
 //  color0:	#${config.colorScheme.palette.base00}5C;
   color0:	#${config.colorScheme.palette.base00}CC;
   color1:	#${config.colorScheme.palette.base01};
   color2:	#${config.colorScheme.palette.base02};
   color3:	#${config.colorScheme.palette.base03};
   color4:	#${config.colorScheme.palette.base04};
   color5:	#${config.colorScheme.palette.base05};
   color6:	#${config.colorScheme.palette.base06};
   color7:	#${config.colorScheme.palette.base07};
   color8:	#${config.colorScheme.palette.base08};
   color9:	#${config.colorScheme.palette.base09};
}
	'';

 wayland.windowManager.hyprland.extraConfig = ''
 general {
   cursor_inactive_timeout = 4
   col.active_border = rgba(${config.colorScheme.palette.base0C}ee) rgba(${config.colorScheme.palette.base0D}ee) 45deg
   col.inactive_border = rgba(${config.colorScheme.palette.base0A}aa)
   layout = dwindle
   border_size = 3;
 }
decoration {

   col.shadow = rgba(${config.colorScheme.palette.base05}ee)
   col.shadow_inactive=rgba(${config.colorScheme.palette.base00}ee)
}
 '';
# programs.nixvim.extraConfigVim = ''
# highlight Normal guibg=none
# highlight NonText guibg=none
# highlight Normal ctermbg=none
# highlight NonText ctermbg=none
# '';
#  programs.nixvim.extraConfigLua = ''
# require('base16-colorscheme').setup({["base00"] = "",["base01"] = "#${config.colorScheme.palette.base01}",["base02"] = "#${config.colorScheme.palette.base02}",["base03"] = "#${config.colorScheme.palette.base03}",["base04"] = "#${config.colorScheme.palette.base04}",["base05"] = "#${config.colorScheme.palette.base05}",["base06"] = "#${config.colorScheme.palette.base06}",["base07"] = "#${config.colorScheme.palette.base07}",["base08"] = "#${config.colorScheme.palette.base08}",["base09"] = "#${config.colorScheme.palette.base09}",["base0A"] = "#${config.colorScheme.palette.base0A}",["base0B"] = "#${config.colorScheme.palette.base0B}",["base0C"] = "#${config.colorScheme.palette.base0C}",["base0D"] = "#${config.colorScheme.palette.base0D}",["base0E"] = "#${config.colorScheme.palette.base0E}",["base0F"] = "#${config.colorScheme.palette.base0F}"})
#       '';

programs.foot.settings = with config.colorScheme.palette; {
  colors = {
    alpha=0.63;
    foreground="${base06}";
    background="${base00}";
# alpha=1

## Normal/regular colors (color palette 0-7)
regular0="${base00}"; # black
regular1="${base0D}"; # red
regular2="${base0C}"; # green
regular3="${base0B}"; # yellow
regular4="${base0E}"; # blue
regular5="${base08}"; # magenta
regular6="${base06}"; # cyan
regular7="${base0A}"; # white

## Brights (color palette 8-15)
bright0="${base00}";  # bright black
bright1="${base0D}";  # bright red
bright2="${base0C}";  # bright green
bright3="${base0B}";  # bright yellow
bright4="${base0E}";  # bright blue
bright5="${base08}";  # bright magenta
bright6="${base06}";  # bright cyan
bright7="${base09}";  # bright white

};
};

}
