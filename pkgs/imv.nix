{ config, pkgs, ... }:
let 
rename = pkgs.pkgs.writeShellScript "rename" ''
#!/bin/sh
new="$(rofi -dmenu -l 1)"
[ ! -z $new ] && mv $1 "$(dirname $1)/$new.png" 
'';
in
{
programs.imv = {
enable =true;
settings ={

  aliases = {
  q = "quit";
gg = "goto 1";
"<Shift+G>" = "goto -1";
x = "exec rm \"$imv_current_file\"; close";
u = "exec ${rename} \"$imv_current_file\"";
};
};
};
}

