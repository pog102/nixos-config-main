{ config, pkgs, ... }:
{
environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  konsole
  oxygen
];

}
