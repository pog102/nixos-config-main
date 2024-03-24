{ config, pkgs, ... }:
{
	services.xserver.enable=true;
    services.xserver.displayManager.sddm = {


	    enable=true;
	    # defaultSession="hyprland";
	    wayland.enable=true;
	    # settings = {
		   #  Autologin = {
    	# 		Session = "plasma.desktop";
    	# 		User = "chad";
  			# 	};
	    # }
    };
}

