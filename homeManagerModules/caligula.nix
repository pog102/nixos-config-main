{ inputs, lib, config, pkgs, ... }:
{
  options = {
    caligula.enable = lib.mkEnableOption "enable nyaa file";
  };
  config = lib.mkIf config.caligula.enable {
    home.packages = with pkgs; [
      inputs.caligula.packages.x86_64-linux.default
    ];
    #   home.file.".config/nyaa/config.toml".text = ''
    # default_category = "AllCategories"
    # default_filter = "NoFilter"
    # default_sort = "Seeders"
    # default_search = ""
    # theme = "Default"
    # source = "NyaaHtml"
    # download_client = "command"
    # date_format = "%Y-%m-%d %Hh"
    # base_url = "https://nyaa.si/"
    # timeout = 30
    #
    # [client.command]
    # cmd = "transadd \"{magnet}\""
    # shell_cmd = "sh -c"
    #   '';
  };
}

