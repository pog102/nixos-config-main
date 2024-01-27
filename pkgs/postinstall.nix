{ inputs, pkgs, lib, ... }:
{

stdenv.mkDerivation = {

  postInstall =
    ''
    swww img /home/chad/Pictures/wallhaven-85p65k.png
    '';
};

}
