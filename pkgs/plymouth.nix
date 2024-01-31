{ config, pkgs, ... }:
let
  nixos-load-src = pkgs.fetchFromGitHub {
    owner = "paulchambaz";
    repo = "nixos-plymouth";
    rev = "main";
    sha256 = "";
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
