{ config, pkgs, ... }:

{

services.btop = {
  enable = true;

  settings = {

olor_theme = "Default";

#* If the theme set background should be shown, set to False if you want terminal background transparency.
theme_background = true;


  };
};
}
