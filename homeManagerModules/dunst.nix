{ lib, config, pkgs, ... }:

{
  options = {
    dunst.enable = lib.mkEnableOption "enable dunst file";
  };
  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
      # settings = {
      #
      #   urgency_normal = {
      #
      #     background = "#${config.colorScheme.colors.base00}";
      #     # foreground ="#2339B6";
      #     foreground = "#${config.colorScheme.colors.base06}";
      #     timeout = 3;
      #
      #   };
      #
      #   urgency_critical = {
      #
      #     background = "#${config.colorScheme.colors.base00}";
      #     # foreground ="#2339B6";
      #     foreground = "#${config.colorScheme.colors.base06}";
      #     timeout = 3;
      #
      #   };
      #
      #   urgency_low = {
      #
      #     background = "#${config.colorScheme.colors.base01}";
      #     # foreground ="#2339B6";
      #     foreground = "#${config.colorScheme.colors.base06}";
      #     timeout = 3;
      #
      #   };
      #   global = {
      #
      #     # font = "Fira Code 13";
      #     font = "FiraCode Nerd Font 13";
      #     corner_radius = 16;
      #     # Make the width 3740 (3840 - 100), have 50 left margin and 95 above
      #     follow = "mouse";
      #     #geometry = "0x0-520+520"
      #     shrink = "no";
      #     offset = "0x4";
      #     #width = 320
      #     width = "(300, 400)";
      #     #scale = 0
      #     # Show multiple notifications in the same box
      #     separator_height = 1;
      #     # Sort messages by urgency.
      #     sort = "yes";
      #     # Add vertical padding to the inside of the notification
      #     padding = 10;
      #     # Ignore newlines '\n' in notifications.
      #     ignore_newline = "no";
      #
      #     # Add horizontal padding for when the text gets long enough
      #     horizontal_padding = 24;
      #
      #     # The frame color and width of the notification
      #     frame_color = "#${config.colorScheme.colors.base03}";
      #     frame_width = 0;
      #
      #     # How long a user needs to be idle for sticky notifications
      #     idle_threshold = 120;
      #
      #     # browser = /usr/bin/xdg-open
      #     # mouse_left_click = open_url, close_current
      #     # Font and typography settings
      #     alignment = "left";
      #     icons_position = "Left";
      #     max_icon_size = 77;
      #     #icon_size = 33
      #     icon_path = "/home/chad/.local/share/icons/walcons";
      #     word_wrap = "yes";
      #     ellipsize = "end";
      #     origin = "top-center";
      #     # Markup is allowed
      #     format = "<b>%s</b>\n%b";
      #     #format = "%i%s %b"
      #     # Allow some HTML tags like <i> and <u> in notifications
      #     markup = "full";
      #     #bar 
      #     progress_bar_frame_width = 1;
      #     #frame_color = "#1D36C1"
      #
      #     highlight = "#${config.colorScheme.colors.base06}";
      #     progress_bar_corner_radius = 20;
      #     progress_bar_max_corner_radius = 40;
      #     #transparency = 73;
      #
      #
      #
      #   };

      # };

    };
  };
}
