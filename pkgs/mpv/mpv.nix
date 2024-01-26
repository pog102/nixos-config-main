{ self, config, pkgs, ... }:

{

programs.mpv = {
  enable = true;
  config = {
osc="no";
border = "no";

# };
  };
};
	home.file.".config/mpv/scripts/modern.lua" = {
		recursive = false;
		source = ./modern.lua;
	};

	home.file.".config/mpv/fonts/Material-Design-Iconic-Font.ttf" = {
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
