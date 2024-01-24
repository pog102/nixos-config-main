{ config, lib, pkgs, ... }:

{
  programs.foot= {
  enable = true;
  settings = {
main = {
font = "Hack Nerd Font:size=11";
pad = "20x20";
dpi-aware="yes";
};

colors = with config.colorScheme.colors; {
 alpha="0.63";
foreground="${base06}";
background="${base00}";
# alpha=1

## Normal/regular colors (color palette 0-7)
regular0="${base00}";  # black
regular1="${base0D}";  # red
regular2="${base0C}";  # green
regular3="${base0B}";  # yellow
regular4="${base0E}";  # blue
regular5="${base08}";  # magenta
regular6="${base06}";  # cyan
regular7="${base0A}";  # white

## Bright colors (color palette 8-15)
bright0="${base00}";  # bright black
bright1="${base0D}";  # bright red
bright2="${base0C}";  # bright green
bright3="${base0B}";  # bright yellow
bright4="${base0E}";  # bright blue
bright5="${base08}";  # bright magenta
bright6="${base06}";  # bright cyan
bright7="${base09}";  # bright white

};

 key-bindings = {
 clipboard-copy = "Control+c XF86Copy";
 clipboard-paste = "Control+v XF86Paste";
font-increase="Control+plus Control+equal Control+Shift+Up Control+KP_Add";
font-decrease="Control+minus Control+Shift+Down Control+KP_Subtract";
font-reset="Control+0 Control+KP_0";

 };
};
};
}
