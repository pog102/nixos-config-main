{ userSettings,lib,inputs,config, pkgs, ... }:
{ 
  imports = [
    inputs.nix-colors.homeManagerModules.default
		../pkgs/starship.nix
		../pkgs/dunst.nix
		../pkgs/genicon.nix
		# ../pkgs/dunst.nix
  ];
  # colorScheme = inputs.nix-colors.colorSchemes."gruvbox-dark-medium";
 # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

 colorScheme = inputs.nix-colors.colorSchemes.${userSettings.theme};



# services.dunst = {
# settings = {
#
#
#
# };
# };
programs.rofi = {
extraConfig ={
theme="~/.config/rofi/themes/color.rasi";
};
};
	home.file.".config/rofi/themes/color.rasi".text = ''
	*{
   color1:	${config.colorScheme.colors.base01};
   color2:	${config.colorScheme.colors.base02};
   color3:	${config.colorScheme.colors.base03};
   color4:	${config.colorScheme.colors.base04};
   color5:	${config.colorScheme.colors.base05};
   color6:	${config.colorScheme.colors.base06};
   color7:	${config.colorScheme.colors.base07};
   color8:	${config.colorScheme.colors.base08};
   color9:	${config.colorScheme.colors.base09};
	}
	'';

 wayland.windowManager.hyprland.extraConfig = ''
 general {
   cursor_inactive_timeout = 4
   col.active_border = rgba(${config.colorScheme.colors.base0C}ee) rgba(${config.colorScheme.colors.base0D}ee) 45deg
   col.inactive_border = rgba(${config.colorScheme.colors.base0A}aa)
   layout = dwindle
   border_size = 3;
 }
decoration {

   col.shadow = rgba(${config.colorScheme.colors.base05}ee)
   col.shadow_inactive=rgba(${config.colorScheme.colors.base00}ee)
}
 '';
 programs.nixvim.extraConfigLua = ''
require('base16-colorscheme').setup({["base00"] = "",["base01"] = "#${config.colorScheme.colors.base01}",["base02"] = "#${config.colorScheme.colors.base02}",["base03"] = "#${config.colorScheme.colors.base03}",["base04"] = "#${config.colorScheme.colors.base04}",["base05"] = "#${config.colorScheme.colors.base05}",["base06"] = "#${config.colorScheme.colors.base06}",["base07"] = "#${config.colorScheme.colors.base07}",["base08"] = "#${config.colorScheme.colors.base08}",["base09"] = "#${config.colorScheme.colors.base09}",["base0A"] = "#${config.colorScheme.colors.base0A}",["base0B"] = "#${config.colorScheme.colors.base0B}",["base0C"] = "#${config.colorScheme.colors.base0C}",["base0D"] = "#${config.colorScheme.colors.base0D}",["base0E"] = "#${config.colorScheme.colors.base0E}",["base0F"] = "#${config.colorScheme.colors.base0F}"})
      '';

programs.foot.settings = with config.colorScheme.colors; {
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
