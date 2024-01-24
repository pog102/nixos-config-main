{ lib,inputs,config, pkgs, ... }:

{
imports = [
inputs.nix-colors.homeManagerModules.default
];
# colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;



wayland.windowManager.hyrpland = {
# enable = true;
extraConfig = ''
general {
    cursor_inactive_timeout = 4
    col.active_border" = rgba(${config.colorScheme.colors.base0E}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg
    col.inactive_border = rgba(${config.colorScheme.colors.base00}ff)
    layout = dwindle
}
'';
};

programs.foot.settings.general = {
    cursor_inactive_timeout = 4;
    "col.active_border" = "rgba(${config.colorScheme.colors.base0E}ff) rgba(${config.colorScheme.colors.base09}ff) 45deg";
    "col.inactive_border" = "rgba(${config.colorScheme.colors.base00}ff)";
    layout = "dwindle";
};


}
