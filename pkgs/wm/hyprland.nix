{ config, userSettings, lib, pkgs, ... }:

let 
bright = pkgs.pkgs.writeShellScript "bright" ''

#!/bin/sh
brillo -q -$1 1

brightness=$(printf "%.0f\n" $(brillo -G))
icon="xfpm-brightness-lcd"
if [ "$brightness" -gt 70 ]; then
	icon="sun"
elif [ "$brightness" -gt 45 ]; then
	icon="sun_half"
#elif [  "$brightness" -gt 25  ]; then
#	icon="sun_low"
else
	icon="sun_emp"
fi
	notify-send -a "mediakeys" -u low -r 50 -h int:value:"$brightness" -i "$icon" "$brightness%" -t 1100
'';

powermenu = pkgs.pkgs.writeShellScript "powermenu" ''
#!/bin/env bash
 
# Options for powermenu
reboot="󰦛"
sleep=""
shutdown=""
# Get answer from user via rofi
selected_option=$(echo "$shutdown
$reboot
$sleep" | rofi -dmenu\
                  -i\
                  -p "Power"\
		  -theme power2)
# Do something based on selected option
if [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    systemctl suspend
else
    echo "No match"
fi


'';

volume = pkgs.pkgs.writeShellScript "volume" ''
#!/bin/sh
pamixer -$1 2
volume=$(pamixer --get-volume)
# noti () {
notify-send -a "mediakeys" -u low -r 51 -h int:value:"$volume" -i "volume$1"  "$volume%" -t 1100
# }
# if [ $volume -lt 30 ]; then
# 	noti low
# elif [ $volume -lt 60 ];then
# 	noti medium
# else
# 	noti high
# fi
'';
in
{
 wayland.windowManager.hyprland = {
    enable = true;
settings = {
env = [
# "LIBVA_DRIVER_NAME,nvidia"
# "XDG_SESSION_TYPE,wayland"
"WLR_NO_HARDWARE_CURSORS,1"
];
# exec-once= ''${start}'';
exec-once="swww init &";
decoration = {
##shadow_offset = "0.5";
rounding  = 18;
   blur = {
enabled=true;
 brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;

        passes = 3;
        size = 4;
   # passes = 1;
   # vibrancy = 0.5;
   # brightness = 1;
   };
 drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 16;
      shadow_render_power = 2;
  };

misc = {
  animate_manual_resizes = true;
  animate_mouse_windowdragging = true;
  disable_hyprland_logo = true;
  disable_splash_rendering = true;
  mouse_move_enables_dpms = true;
    enable_swallow = true;
swallow_regex = "^(foot)$";
};


"$mod" = "SUPER";
# source = (if (userSettings.wal) then "~/.config/hypr/myColors.conf" else "~/" );
monitor = [
"eDP-1,1920x1080@60,0x0,1"
"HDMI-A-2,1920x1080@144,1920x0, 1"
# "HDMI-A-2,1920x1080@144,0x0,1,eDP-1,disable"
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
	"$mod, D, exec, rofi -show drun -theme gloss &"
       "$mod, Q, killactive"
       "$mod, F, fullscreen"
       "$mod, M, exec, ${powermenu}"
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

"$mod SHIFT, left, movewindow, l"
"$mod SHIFT, right, movewindow, r"
"$mod SHIFT, up, movewindow, u"
"$mod SHIFT, down, movewindow, d"
"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u  "
"$mod, down, movefocus, d"

];
binde = [
"CONTROL, right, exec, ${bright} A"
 "CONTROL, left, exec, ${bright} U"
"CONTROL, up, exec, ${volume} i"
"CONTROL, down, exec, ${volume} d"
];
};
    xwayland = { enable = true; };
	systemd.enable = true;
};
}
