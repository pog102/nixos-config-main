{ lib, config, inputs, pkgs, ... }:
{
  options = {
    transg.enable = lib.mkEnableOption "enable transg file";
  };
  config = lib.mkIf config.transg.enable {
    home.packages = with pkgs; [
      inputs.trans.packages.x86_64-linux.default
    ];

    home.file.".config/transg/transg-tui.toml".text = ''
      refresh_interval = 1200
      # one of: "upload" "donwload" "none"
      traffic-monitor = "upload"
      # true/false show file icons, nerdfont is required
      show-icons = true


      [[connections]]
      name = "localhost"
      username = ""
      password = ""
      url = "http://127.0.0.1:9091/transmission/rpc"
      #
      # optional. explicitly sets transmission's download directory
      # download-dir = "/var/lib/transmission/downloads"
      #
      # optional. Set this if you have remote transmission folder mounted on the local filesystem. 
      # If set, {location} token gets replaced with the local folder.
      local-download-dir = "/run/mount/transmission"


      [[actions]]
      description = "open in nautilus"
      shortcut = "o"
      cmd = "mpv"
      args = ["--fs", "--no-terminal", "{download_dir}/{name}", "&>/dev/null" ]

      [[actions]]
      description = "terminal"
      shortcut = "t"
      cmd = "notify-send"
      args = ["exec", "--", "foot", "--working-directory", "\"{location}\""]

      # Actions for individual files
      [[file-actions]]
      description = "open"
      shortcut = "o"
      cmd = "notify-send"
      args = ["\"{location}/{name}\""]
      [[file-actions]]
      description = "copy path to clipboard"
      shortcut = "c"
      cmd = "wl-copy"
      args = [ "{location}" ]

      # Colors, (experimental and subject to change):
      # Both section must be present in the config
      # [colors.main]
      # text = "Gray"
      # highlight = "Magenta"
      # highlight-text = "DarkGray"
      # text-soft = "Gray"
      # text-error = "Red"
      # [colors.details]
      # text = "Gray"
      # highlight = "LightGreen"
      # highlight-text = "DarkGray"
      # text-soft = "Gray"
      # text-error = "Red"
    '';
  };
}

