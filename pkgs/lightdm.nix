{ config, pkgs, ... }:
{
    # services.xserver.displayManager.autoLogin=true;
    # services.xserver.displayManager.autoLogin.user = "chad";
    services.xserver.displayManager.lightdm =  {
enable =true;

    };
}

