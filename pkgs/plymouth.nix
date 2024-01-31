{ config,lib, pkgs, ... }:
let
  nixos-load-src = pkgs.fetchFromGitHub {
    owner = "paulchambaz";
    repo = "nixos-plymouth";
    rev = "refs/heads/master";
    sha256 = "sha256-aJWRwvRCaDKBesIdg0rqIXkQ6a2nVgbkOkNqA/lD/Ow=";
  };
  nixos-load = pkgs.callPackage nixos-load-src {};
in
{
  boot.plymouth = {
    enable = true;
    themePackages = [ nixos-load ];
    theme = "nixos-load";
  };
}
