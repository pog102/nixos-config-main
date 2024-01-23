{ config, lib, pkgs, ... }:

{
 wayland.windowManager.hyprland = {
    enable = true;
settings ={
decoration = {
shadow_offset = "0.5";

};

"$mod" = "SUPER";

bind = [
       "$mod, Return, exec, foot"
       "$mod, D, exec, firefox"
];

  };
    xwayland = { enable = true; };
	systemd.enable = true;
};
}
