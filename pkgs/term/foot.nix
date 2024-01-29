{ config, lib, pkgs, ... }:

{
  programs.foot= {
  enable = true;
  settings = {
main = {
font = "Hack Nerd Font:size=15";
pad = "20x20";
dpi-aware="no";
};

 cursor ={
	 style="beam";
	# color=<inverse foreground/background>
	blink=true;
	 # beam-thickness="1.0";
	# underline-thickness=<font underline thickness>
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
