{ config, lib, pkgs, ... }:

{
 home.packages = with pkgs; [
 foot
  ];
  programs.foot.enable = true;
  #programs.alacritty.settings = {
  #  window.opacity = lib.mkForce 0.65;
  #};


}
