{ config, lib, pkgs, ... }:

{
 wayland.windowManager.hyprland = {
    enable = true;
settings ={
decoration = {
shadow_offset = "0.5";

};

"$mod" = "SUPER";

bindm = [
       "$mod,RETURN,exec,foot"
       "$mod,D,exec,firefox"
];

  };
    xwayland = { enable = true; };
	systemd.enable = true;
};
}
