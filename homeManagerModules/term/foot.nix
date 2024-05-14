{ config, lib, pkgs, ... }:

{
  options = {
    foot.enable = lib.mkEnableOption "enable foot file";
  };
  config = lib.mkIf config.foot.enable {
    programs.foot = {
      enable = true;
      #   package = pkgs.foot.overrideAttrs (_: rec {
      #   version = "1.6.1";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "DanteAlighierin";
      #     repo = "foot";
      #     rev = version;
      #     sha256 = "sha256-u39dqB2c6lu5e7fs6Zl0NlsnKfo+2F8uC2XHvyekOR4=";
      #   };
      # });
      settings = {
        main = {

          # font = "Hack Nerd Font:size=13";
          font = "JetBrainsMono Nerd Font:size=13";
          # font = "Font Awesome 6 Brands Regular:size=15";
          pad = "20x20";
          dpi-aware = "no";
        };

        cursor = {
          style = "beam";
          # color=<inverse foreground/background>
          blink = true;
          # beam-thickness="1.0";
          # underline-thickness=<font underline thickness>
        };
        search-bindings = {
          cancel = "Control+x";


        };
        url = {
          launch = "firefox \${url}";
          label-letters = "sadfjklewcmpgh";
          osc8-underline = "url-mode";
          protocols = "http, https, ftp, ftps, file, gemini, gopher";
          uri-characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+=\"'()[]";
        };
        key-bindings = {
          clipboard-copy = "Control+c XF86Copy";
          clipboard-paste = "Control+v XF86Paste";
          font-increase = "Control+plus Control+equal Control+Shift+Up Control+KP_Add";
          font-decrease = "Control+minus Control+Shift+Down Control+KP_Subtract";
          font-reset = "Control+0 Control+KP_0";

        };
      };
    };
  };
}
