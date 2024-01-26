{ self, config, pkgs, ... }:

{

programs.mpv = {
  enable = true;
  config = {
osc="no";

# Idle = {
profile-cond="p['idle-active']";
profile-restore = "copy-equal";
title = " ";
keepaspect = "no";
background = 1;

# };
  };
};
	home.file.".config/mpv/scripts" = {
		recursive = false;
		source = ./modern.lua;
	};

	home.file.".config/mpv/fonts" = {
		recursive = false;
		source = ./Material-Design-Iconic-Font.ttf;
	};

nixpkgs.overlays = [
  (self: super: {
    mpv = super.mpv.override {
      scripts = [ self.mpvScripts.thumbfast
		# self.mpvScripts.chapterskip

      ];
    };
  })
];
}
