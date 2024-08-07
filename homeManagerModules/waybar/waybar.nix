{ lib, config, pkgs, ... }:
{
  options = {
    waybar.enable = lib.mkEnableOption "enable waybar file";
  };
  config = lib.mkIf config.waybar.enable {
    xdg.configFile."waybar/style.css".source = ./style2.css;
    xdg.configFile."waybar/config".source = ./config;
    programs.waybar = {
      enable = true;
      # settings = {
      # mainBar = {
      # layer = "top";
      #     modules-left = ["hyprland/workspaces"];
      #     modules-center= ["clock"];
      #     modules-right= ["backlight" "wireplumber" "network" "battery"];
      #     "hyprland/workspaces" = {
      #       format= "{icon}";
      #       on-click= "activate";
      #       on-scroll-up= "hyprctl dispatch workspace e+1";
      #      on-scroll-down= "hyprctl dispatch workspace e-1";
      # format-icons= {
      # "1"="-"; 
      # "2"="二";
      # "3"="三";
      # "4"="四";
      # "5"="五";
      # "6"="六";
      # "7"="七";
      # "8"="八";
      # "9"="九";
      # "10"="十";
      #         };
      #     };
      #     clock= {
      #       format= " {:%H:%M}";
      #       format-alt= "{:%Y-%m-%d}  ";
      # 	tooltip-format= "<big>{:%Y %B}</big>\n<tt><big>{calendar}</big></tt>";
      #         # calendar= {
      #         #             "mode"          = "year";
      #         #             "mode-mon-col"  = 3;
      #         #             "weeks-pos"     = "right";
      #         #             "on-scroll"     = 1;
      #         #             "on-click-right" = "mode";
      #         #             format= {
      #         #                       months=     "<span color='#ffead3'><b>{}</b></span>";
      #         #                       days=       "<span color='#ecc6d9'><b>{}</b></span>";
      #         #                       weeks=      "<span color='#99ffdd'><b>W{}</b></span>";
      #         #                       weekdays=   "<span color='#ffcc66'><b>{}</b></span>";
      #         #                       today=      "<span color='#ff6699'><b><u>{}</u></b></span>";
      #         #                       };
      #         #             };
      #     };
      #     wireplumber = {
      #     format= "{volume}% {icon}";
      #     format-muted = "";
      #     on-click= "helvum";
      #     format-icons = ["" "" ""];
      # };
      # #     "backlight= {
      # #       "device= "intel_backlight";
      # #       "format= "{icon} {percent}%";
      # #       "format-icons= [""; ""; ""; ""; ""; ""; ""; ""; ""]
      # #     },
      # # "image#album-art= {
      # # 	"path= "~/.cache/music/Swell.png";
      # # 	"size= 32,
      # # 	"interval= 5,
      # # 	"on-click= "mpc toggle"
      # # },
      # #     "pulseaudio= {
      # # 	"format= "{icon} {volume}%";
      # # 	"format-bluetooth= "{volume}% {icon}";
      # # 	"format-muted= "";
      # # 	"format-icons= {
      # # 		"headphones= "";
      # # 		"handsfree= "";
      # # 		"headset= "";
      # # 		"phone= "";
      # # 		"portable= "";
      # # 		"car= "";
      # # 		"default= [""; ""]
      # # 	},
      # # 	"scroll-step= 1,
      # # 	"on-click= "pavucontrol"
      # # },
      # #
      # # "disk= {
      # #             "signal= 1,
      # #         "format= " {percentage_used}%";
      # #       "interval= 50,
      # #     "path= "/home"
      # # },
      # #
      # # "custom/wf= {
      # #     "exec= "~/.bin/tk.sh";
      # #     "format= "{}";
      # #     "interval= "once";
      # #     "signal= 13
      # # },
      # #
      # # "mpd= {
      # #     "format= "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
      # #     "format-disconnected= "Disconnected ";
      # #     "format-stopped= "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
      # #     "interval= 10,
      # #     "consume-icons= {
      # #         "on= " " // Icon shows only when "consume" is on
      # #     },
      # #     "random-icons= {
      # #         "off= "<span color=\"#f53c3c\"></span> "; // Icon grayed out when "random" is off
      # #         "on= " "
      # #     },
      # #     "repeat-icons= {
      # #         "on= " "
      # #     },
      # #     "single-icons= {
      # #         "on= "1 "
      # #     },
      # #     "state-icons= {
      # #         "paused= "";
      # #         "playing= ""
      # #     },
      # #     "tooltip-format= "MPD (connected)";
      # #     "tooltip-format-disconnected= "MPD (disconnected)"
      # # },
      # #
      # # "custom/bb= {
      # #     "format= "{}";
      # #     "return-type= "json";
      # #     "interval= "once";
      # #     "exec= "/home/chad/.bin/birthday";
      # #         "tooltip= true
      # # },
      # #
      # # "custom/torrent= {
      # # "format="{}";
      # # "exec" : "/home/chad/.bin/torbar";
      # # "interval" : 30,
      # # "tooltip= true,
      # #         "return-type" : "json"
      # # },
      # # "custom/pacman= {
      # #   "format= "{icon}{}";
      # #   "return-type= "json";
      # #   "format-icons= {
      # #     "pending-updates= " ";
      # #         "updated= ""
      # #   },
      # #   "exec-if= "which waybar-updates";
      # #   "exec= "waybar-updates"
      # # },
      # #  "custom/weather" : {
      # #         //shows the current weather and forecast
      # #         "tooltip" : true,
      # #         "format" : "{}";
      # #             "signal= 8,
      # #         "interval" : 30,
      # #         "exec" : "~/.bin/waybar-wttr.py";
      # #         "on-click= "~/.bin/wet_check;pkill -SIGRTMIN+8 'waybar'";
      # #         "return-type" : "json"
      # #     },
      # #
      # #
      # # "bluetooth= {
      # # 	"format-on= " ";
      # # 	"format-off= "";
      # # 	"format-connected= " {device_alias}</span>";
      # # 	"format-connected-battery= " {device_alias} {device_battery_percentage}%";
      # # 	// "format-device-preference= [ "device1"; "device2" ], // preference list deciding the displayed device
      # # 	"tooltip-format= "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      # # 	"tooltip-format-connected= "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      # # 	"tooltip-format-enumerate-connected= "{device_alias}\t{device_address}";
      # # 	"tooltip-format-enumerate-connected-battery= "{device_alias}\t{device_address}\t{device_battery_percentage}%"
      # # },
      # #
      # #  "custom/github= {
      # #     "format= "{} ";
      # #     "return-type= "json";
      # #     "interval= 3600,
      # #     "exec= "$HOME/.config/waybar/bin/github.sh";
      # #     "on-click= "xdg-open https://github.com/notifications"
      # #   },
      # #
      # # "custom/pipewire= {
      # #         "tooltip= false,
      # #         "max-length= 6,
      # #         "signal= 14,
      # #     "exec= "$HOME/.bin/pipewire.sh"
      # # },
      # #
      # # "network= {
      # #     "interface= "wlan0";
      # #     "format= "󰖪 Disabled";
      # #     "format-wifi= "  {signalStrength}%";
      # #     "format-ethernet= "{ipaddr}/{cidr} ";
      # #     "format-disconnected= "󰖪 Disconnected"; //An empty format will hide the module.
      # #     "tooltip-format= "{ifname} via {gwaddr} ";
      # #     "tooltip-format-wifi= "{ipaddr}\n{bandwidthUpBits}\n{bandwidthDownBits}";
      # #     "tooltip-format-ethernet= "{ifname} ";
      # #     "tooltip-format-disconnected= "Disconnected";
      # #       "on-click= "sh $HOME/.bin/tog_wifi";
      # #     "max-length= 50
      # # },
      # #   "custom/updates= {
      # #     "format= "{}";
      # #     "interval= 3600,
      # #     "exec= "~/.bin/updatecheck";
      # #     "return-type= "json";
      # #     "exec-if= "exit 0";
      # #     "signal= 8
      # #   },
      # #
      # #     "battery= {
      # #         "signal= 11,
      # #         "on-click= "~/.bin/gamemode";
      # #          "states= {
      # #             "warning= 20,
      # #             "critical= 10
      # #         },
      # #       "format= "{icon} {capacity}%";
      # #       "format-icons= [""; ""; ""; ""; ""; ""; ""; ""; ""; ""],
      # #       "format-charging= " {capacity}%"
      # #     },
      # #
      # #
      # #
      # # 	};
      # };

      # };
    };
  };
}
