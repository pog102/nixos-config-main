{ config, pkgs, ... }:
{

home.packages = with pkgs; [(pkgs.callPackage ./default.nix { })];

  home.file.".config/transg/transg-tui.toml".text = ''
  refresh_interval = 1200
# one of: "upload" "donwload" "none"
traffic-monitor = "upload"
# true/false show file icons, nerdfont is required
show-icons = true


[[connections]]
name = "NAS"
username = ""
password = ""
url = "http://192.168.1.18:9091/transmission/rpc"
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
cmd = "notify-send"
args = ["exec", "--", "lf", "\"{location}\""]

[[actions]]
description = "terminal"
shortcut = "t"
cmd = "notify-send"
args = ["exec", "--", "foot", "--working-directory", "\"{location}\""]

# Actions for individual files
[[file-actions]]
description = "open"
shortcut = "o"
cmd = "swaymsg"
args = ["exec", "--", "handlr", "open", "\"{location}\""]
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
}

