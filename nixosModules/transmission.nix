{ lib, config, pkgs, ... }:

let
  tornoty = pkgs.pkgs.writeShellScript "tornoty" ''
      notify-send -a trans -i trans "Transmission" "$TR_TORRENT_NAME has completely downloaded"  ## && polybar-msg action "#torrents.hook.0"  #&& pkill -SIGRTMIN+2 i3blocks
    # transmission-remote -l | awk '$2 == "100%"{ system("transmission-remote -t " $1 " --remove") }'
  '';
in
{
  options = {
    transmission.enable = lib.mkEnableOption "enable transmission file";
  };
  config = lib.mkIf config.transmission.enable {
    services.transmission = {
      enable = true;
      user = "chad";
      # openRPCPort = true; #Open firewall for RPC
      settings = {
        #Override default settings
        # home = "/home/chad";
        # script-torrent-done-enabled = true;
        # script-torrent-done-filename = "/home/chad/.bin/tordone";


        # alt-speed-down = 50;
        # alt-speed-enabled = false;
        # alt-speed-time-begin = 540;
        # alt-speed-time-day = 127;
        # alt-speed-time-enabled = false;
        # alt-speed-time-end = 1020;
        # alt-speed-up = 50;
        #     bind-address-ipv4 = "0.0.0.0";
        # bind-address-ipv6= "::";
        # blocklist-enabled = false;
        # blocklist-url = "http=//www.example.com/blocklist";
        # cache-size-mb = 4;
        # dht-enabled = true;

        download-dir = "/home/chad/Shows/";
        incomplete-dir = "/home/chad/Shows/";
        # download-queue-enabled = true;
        # download-queue-size = 2;
        # encryption = 1;
        # idle-seeding-limit = 30;
        # idle-seeding-limit-enabled = false;
        # incomplete-dir-enabled = true;
        # lpd-enabled = false;
        # message-level = 2;
        # peer-congestion-algorithm = "";
        # peer-id-ttl-hours = 6;
        # peer-limit-global = 200;
        # peer-limit-per-torrent = 50;
        # peer-port = 64321;
        # peer-port-random-high = 65535;
        # peer-port-random-low = 49152;
        # peer-port-random-on-start = false;
        # peer-socket-tos = "default";
        # pex-enabled = true;
        # port-forwarding-enabled = false;
        # preallocation = 1;
        # prefetch-enabled = 1;
        # queue-stalled-enabled = true;
        # queue-stalled-minutes = 10;
        # ratio-limit = 1;
        # ratio-limit-enabled = true;
        # rename-partial-files = true;
        # rpc-authentication-required = true;
        # rpc-bind-address = "0.0.0.0";
        # rpc-enabled = false;
        # rpc-port = 9091;
        # rpc-url = "/transmission/";
        # rpc-username = "chad";
        # rpc-whitelist = "127.0.0.1,::1";

        # rpc-whitelist-enabled = false;
        # scrape-paused-torrents-enabled = true;
        script-torrent-done-enabled = true;
        script-torrent-done-filename = "${tornoty}";
        # script-torrent-done-filename = "/home/chad/tor";
        # seed-queue-enabled = true;
        # seed-queue-size = 1;
        # speed-limit-down = 100;
        # speed-limit-down-enabled = false;
        # speed-limit-up = 100;
        # speed-limit-up-enabled = false;
        # start-added-torrents = true;
        # trash-original-torrent-files = false;
        # umask = 18;
        # upload-slots-per-torrent = 14;
        # utp-enabled = true;

      };
    };

  };


}
