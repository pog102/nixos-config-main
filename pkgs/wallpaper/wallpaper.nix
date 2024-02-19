 { pkgs,userSettings, ... }:
 {

	home.file."Pictures" = {
		recursive = true;
		source = ../../wallpapers/${userSettings.theme};
	};

}
