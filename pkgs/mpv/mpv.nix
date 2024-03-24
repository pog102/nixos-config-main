{ self, config, pkgs, ... }:

{

programs.mpv = {
  enable = true;
  config = {
osc = "no";
border = "no";
sub-font = "Liberation Mono Regular";
sub-border-size = 1;
sub-scale=0.75;
sub-color = "#FFFFFF";
save-position-on-quit=true;
# sub-color = "#000000";

sub-shadow = 3;

sub-shadow-color = "#000000";

sub-shadow-offset = 2;

  };

};
	home.file.".config/mpv/scripts" = {
		recursive = true;
		source = ./scripts;
	};

	home.file.".config/mpv/fonts/modernx-osc-icon.ttf" = {
		recursive = false;
		source = ./modernx-osc-icon.ttf;
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
