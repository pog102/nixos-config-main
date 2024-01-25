{ config, userSettings, lib, pkgs, ... }:

# let 
# start = pkgs.pkgs.writeShellScript "start" ''
# swww init &
# sleep 1
# swww img "$(find ~/Pictures | shuf -n 1)" &
# '';
# in
{
 wayland.windowManager.hyprland = {
    enable = true;
settings = {
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
binde = [
"CONTROL, right, exec, brillo -q -A 1"
 "CONTROL, left, exec, brillo -q -U 1 "
"CONTROL, up, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
"CONTROL, down, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

];
};
    xwayland = { enable = true; };
	systemd.enable = true;
};

}
