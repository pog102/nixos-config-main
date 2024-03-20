{ config, pkgs, ... }:
{

home.packages = with pkgs; [(pkgs.callPackage ./default.nix { })];

  home.file.".config/nyaa/config.toml".text = ''
torrent_client_cmd = "transadd {magnet}"
default_category = "AllCategories"
default_filter = "NoFilter"
default_sort = "Seeders"
default_theme = "Default"
default_search = ""
default_source = "NyaaHtml"
date_format = "%Y-%m-%d %Hh"
base_url = "https://nyaa.si/"
timeout = 30
  '';
}

