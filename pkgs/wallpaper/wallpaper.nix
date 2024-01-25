 { pkgs, ... }:
 {

	home.file."Pictures" = {
		recursive = true;
		source = ../../wallpapers;
	};

}
