{ config, pkgs, ... }:
let 
rename = pkgs.pkgs.writeShellScript "rename" ''
#!/bin/sh
 new="$(rofi -dmenu -l 1)"
 [ ! -z $new ] && mv $1 "$(dirname $1)/$new.png" 
exec /nix/store/mbn8520af7wsj7dydih90cbj6lpa8gwq-user-environment/bin/notify-send -r 188 "$1"
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

};
binds = {

x = "exec rm \"$imv_current_file\"; close";
u = "exec ${rename} \"$imv_current_file\"";
y = "exec /nix/store/mbn8520af7wsj7dydih90cbj6lpa8gwq-user-environment/bin/notify-send -r 188 \"Copied\" \"\" && wl-copy < \"$imv_current_file\"";


};
};
};
}

