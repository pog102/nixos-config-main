{ lib,inputs,config, pkgs, ... }:
{
imports = [
inputs.nix-colors.homeManagerModules.default
];
colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
 # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

 # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
	


	wayland.windowManager.hyprland.extraConfig = ''
 general {
     cursor_inactive_timeout = 4
     col.active_border = rgba(${config.colorScheme.colors.base0E}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg
     col.inactive_border = rgba(${config.colorScheme.colors.base05}ff)
     layout = dwindle
      border_size = 3;
      allow_tearing = true;
 }
	'';


programs.starship.settings = {
# Prompt symbols 
character = {
success_symbol = "[](#a6e3a1 bold)";
error_symbol = "[](#f38ba8)";
vicmd_symbol = "[](#f9e2af)";
};
directory = {
format = "[]($style)[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[$path](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)[ ]($style)";
style = "bg:none fg:#${config.colorScheme.colors.base01}";
truncation_length = 3;
truncate_to_repo=false;
};

git_branch = {
format = "[]($style)[[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)$branch](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
style = "bg:none fg:#${config.colorScheme.colors.base01}";
};
git_status = {
# $all status$ahead_behind
format = "[]($style)[$all_status$ahead_behind](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
style = "bg:none fg:#${config.colorScheme.colors.base01}";
modified = "[󰏬 $count](fg:#FFD700 bg:#${config.colorScheme.colors.base01})";
staged = "[ $count](fg:#228B22 bg:#${config.colorScheme.colors.base01})";
deleted = "[ $count](fg:#DE3163 bg:#${config.colorScheme.colors.base01})";
up_to_date = "";
};
cmd_duration = {
min_time = 1;
# duration & style 
format = "[]($style)[[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)$duration](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
disabled = false;
style = "bg:none fg:#${config.colorScheme.colors.base01}";

};
};

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
