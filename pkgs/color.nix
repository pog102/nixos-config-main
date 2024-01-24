{ lib,inputs,config, pkgs, ... }:

{
imports = [
inputs.nix-colors.homeManagerModules.default
];
# colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
	


	wayland.windowManager.hyprland.extraConfig = ''
		source = ~/.cache/wal/hyprland
 general {
     cursor_inactive_timeout = 4
     col.active_border = rgba(${config.colorScheme.colors.base0E}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg
     col.inactive_border = rgba(${config.colorScheme.colors.base00}ff)
     layout = dwindle
 }
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
