{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.nyaa.homeManagerModule
  ];
  options = {
    nyaa.enable = lib.mkEnableOption "enable nyaa file";
  };
  config = lib.mkIf config.nyaa.enable {
    programs.nyaa = {
      enable = true;
      download_client = "RunCommand";
      date_format = "%Y-%m-%d %Hh";
      scroll_padding = 6;
      source = {
        torrentgalaxy = {
          default_sort = "Seeders";
        };
        nyaa = {
          default_sort = "Seeders";
        };
      };
      client.cmd = {
        cmd = "transadd \"{magnet}\"";
        shell_cmd = "sh -c";
      };
    };
  };
}

