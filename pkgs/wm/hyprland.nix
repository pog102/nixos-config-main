{ config, lib, pkgs, ... }:

{
 wayland.windowManager.hyprland = {
    enable = true;
settings ={
decoration = {
##shadow_offset = "0.5";
rounding  = 18;
   blur = {

   # blur = 1
   passes = 2;
   new_optimizations = false;
   size = 6.8;
   };

  };
"$mod" = "SUPER";


monitor = [
"eDP-1,1920x1080@60,0x0,1"
"HDMI-A-2,1920x1080@144,1920x0, 1"
",preferred,auto,1"
];
animations = {
   enabled = true;
  bezier = [ 
  "overshot, 0.05, 0.9, 0.1, 1.05"
   "smoothOut, 0.36, 0, 0.66, -0.56         "
	"smoothIn, 0.25, 1, 0.5, 1               "
    ];

  animation = [
 " windows, 1, 5, overshot, slide     "
 "  windowsOut, 1, 4, smoothOut, slide"
 "  windowsMove, 1, 4, default        "
 "  border, 1, 10, default            "
 "  fade, 1, 10, smoothIn             "
 "  fadeDim, 1, 10, smoothIn          "
 "  workspaces, 1, 6, default         "
   ];
};

bind = [
       "$mod, Return, exec, foot"
       "$mod, D, exec, firefox"
       "$mod, Q, killactive"
       "$mod, F, fullscreen"
       "$mod, Space, togglefloating"

"$mod, 1, workspace, 1  "
"$mod, 2, workspace, 2  "
"$mod, 3, workspace, 3  "
"$mod, 4, workspace, 4  "
"$mod, 5, workspace, 5  "
"$mod, 6, workspace, 6  "
"$mod, 7, workspace, 7  "
"$mod, 8, workspace, 8  "
"$mod, 9, workspace, 9  "
"$mod, 0, workspace, 10 "

"$mod SHIFT, 1, movetoworkspace, 1  "
"$mod SHIFT, 2, movetoworkspace, 2  "
"$mod SHIFT, 3, movetoworkspace, 3  "
"$mod SHIFT, 4, movetoworkspace, 4  "
"$mod SHIFT, 5, movetoworkspace, 5  "
"$mod SHIFT, 6, movetoworkspace, 6  "
"$mod SHIFT, 7, movetoworkspace, 7  "
"$mod SHIFT, 8, movetoworkspace, 8  "
"$mod SHIFT, 9, movetoworkspace, 9  "
"$mod SHIFT, 0, movetoworkspace, 10 "

"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u  "
"$mod, down, movefocus, d"

];

};
    xwayland = { enable = true; };
	systemd.enable = true;
};

}
