{ config, pkgs, ... }:
{
	services.xserver.enable=true;
    # services.xserver.displayManager.autoLogin=true;
    # services.xserver.displayManager.autoLogin.user = "chad";
    services.xserver.displayManager.lightdm =  {
enable =true;

    };
}

