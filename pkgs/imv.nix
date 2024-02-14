{ config, pkgs, ... }:
{
programs.imv = {
enable =true;
settings ={

  aliases = {
  q = "quit";

x = "exec rm \"$imv_current_file\"; close";
};
};
};
}

