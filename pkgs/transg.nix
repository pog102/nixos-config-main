{ config,lib, pkgs, ... }:
# let
{
  home-manager = pkgs.fetchFromGitHub {
    owner = "PanAeon";
    repo = "transg-tui";
    rev = "...";
    # rev = "main";
    sha256 = "${lib.fakeSha256}";
  };
}
  # nixos-load = pkgs.callPackage nixos-load-src {};
# in
# {
#    apps.transg-tui = {
#      enable = true;
#    };
# }
