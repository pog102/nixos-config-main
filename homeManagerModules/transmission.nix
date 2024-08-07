{ lib, config, pkgs, ... }:

let
  tornoty = pkgs.pkgs.writeShellScript "tornoty" ''
      notify-send -i transmission "Transmission" "$TR_TORRENT_NAME has completely downloaded"  ## && polybar-msg action "#torrents.hook.0"  #&& pkill -SIGRTMIN+2 i3blocks
    # transmission-remote -l | awk '$2 == "100%"{ system("transmission-remote -t " $1 " --remove") }'
  '';
in
{
  options = {
    transmission.enable = lib.mkEnableOption "enable transmission";
  };
  config = lib.mkIf config.transmission.enable {

    home.packages = [
      pkgs.transmission_4

      (pkgs.writeShellScriptBin "transadd" ''
                #!/bin/sh
                # transmission-remote -w "/home/chad/Downloads" -U --add "$@" && notify-send "Transmission" "Torrent added."
                pgrep -x transmission-da > /dev/null || transmission-daemon && sleep 0.3
                transmission-remote -U --add "$@" > /dev/null; notify-send -i transmission "Transmission" "Torrent added."
        	exit
      '')

      (pkgs.makeDesktopItem {
        name = "torrent";
        desktopName = "Torrent";
        exec = "transadd  %U";
        terminal = false;
        noDisplay = true;
        type = "Application";
        mimeTypes = [
          "application/x.bittorrent"
          "x-scheme-handler/magnet"
        ];
      })
    ];

    home.file.".config/transmission-daemon/settings.json".text = ''
      {
          "alt-speed-down": 50,
          "alt-speed-enabled": false,
          "alt-speed-time-begin": 540,
          "alt-speed-time-day": 127,
          "alt-speed-time-enabled": false,
          "alt-speed-time-end": 1020,
          "alt-speed-up": 50,
          "bind-address-ipv4": "0.0.0.0",
          "bind-address-ipv6": "::",
          "blocklist-enabled": false,
          "blocklist-url": "http://www.example.com/blocklist",
          "cache-size-mb": 4,
          "dht-enabled": true,
          "download-dir": "/home/chad/Shows/",
          "download-queue-enabled": true,
          "download-queue-size": 5,
          "encryption": 1,
          "idle-seeding-limit": 30,
          "idle-seeding-limit-enabled": false,
          "incomplete-dir": "/home/chad/Shows/",
          "incomplete-dir-enabled": true,
          "lpd-enabled": false,
          "message-level": 2,
          "peer-congestion-algorithm": "",
          "peer-id-ttl-hours": 6,
          "peer-limit-global": 200,
          "peer-limit-per-torrent": 50,
          "peer-port": 51413,
          "peer-port-random-high": 65535,
          "peer-port-random-low": 65535,
          "peer-port-random-on-start": false,
          "peer-socket-tos": "default",
          "pex-enabled": true,
          "port-forwarding-enabled": true,
          "preallocation": 1,
          "prefetch-enabled": true,
          "queue-stalled-enabled": true,
          "queue-stalled-minutes": 30,
          "ratio-limit": 2,
          "ratio-limit-enabled": false,
          "rename-partial-files": true,
          "rpc-authentication-required": false,
          "rpc-bind-address": "127.0.0.1",
          "rpc-enabled": true,
          "rpc-host-whitelist": "",
          "rpc-host-whitelist-enabled": true,
          "rpc-password": "{848cd8be84fbbff4491b64ed9b8eb64e025aba31HUgArZ6K",
          "rpc-port": 9091,
          "rpc-url": "/transmission/",
          "rpc-username": "",
          "rpc-whitelist": "127.0.0.1,::1",
          "rpc-whitelist-enabled": true,
          "scrape-paused-torrents-enabled": true,
          "script-torrent-done-enabled": true,
          "script-torrent-done-filename": "${tornoty}",
          "seed-queue-enabled": false,
          "seed-queue-size": 10,
          "speed-limit-down": 100,
          "speed-limit-down-enabled": false,
          "speed-limit-up": 100,
          "speed-limit-up-enabled": false,
          "start-added-torrents": true,
          "trash-original-torrent-files": false,
          "umask": 2,
          "upload-slots-per-torrent": 14,
          "utp-enabled": true,
          "watch-dir": "/var/lib/transmission/watchdir",
          "watch-dir-enabled": false
      }
    '';
  };
}
