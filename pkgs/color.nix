{ userSettings,lib,inputs,config, pkgs, ... }:
{ 
  imports = [
    inputs.nix-colors.homeManagerModules.default
		../pkgs/starship.nix
		# ../pkgs/dunst.nix
  ];
  # colorScheme = inputs.nix-colors.colorSchemes."gruvbox-dark-medium";
 # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

 colorScheme = inputs.nix-colors.colorSchemes.${userSettings.theme};



 wayland.windowManager.hyprland.extraConfig = ''
 general {
   cursor_inactive_timeout = 4
   col.active_border = rgba(${config.colorScheme.colors.base0E}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg
   col.inactive_border = rgba(${config.colorScheme.colors.base05}ff)
   layout = dwindle
   border_size = 3;
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
