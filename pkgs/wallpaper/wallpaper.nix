 { pkgs,userSettings, ... }:
{

	# home.file."Pictures/town.png".source = pkgs.fetchurl {
	# url = "https://w.wallhaven.cc/full/d6/wallhaven-d6mg33.png";
	# sha256 ="sha256-fYMzoY3un4qGOSR4DMqVUAFmGGil+wUze31rLLrjcAc=";
	# # sha256 =pkgs.lib.fakeHash;
	# };

	home.file."Pictures" = {
		recursive = true;
		source = ../../wallpapers/${userSettings.theme};
	};

}
