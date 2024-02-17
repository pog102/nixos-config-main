{ config, pkgs, ... }:
{
services.kanshi = {
enable=true;

profiles={
undocked = {
  outputs = [
    {
      criteria = "eDP-1";
    }
  ];
};
docked = {
  outputs = [
  #   {
  #     criteria = "eDP-1";
  #   }
    {
      criteria = "HDMI-A-2";
      # transform = "90";
    }
  ];
};



};
};
}

