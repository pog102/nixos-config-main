{ config, lib, pkgs, ... }:

{
  programs.foot= {
  enable = true;
  #programs.alacritty.settings = {
  #  window.opacity = lib.mkForce 0.65;
  #};
  settings = {
main = {
font = "Hack Nerd Font:size=11";
pad = "20x20";
dpi-aware="yes";
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
