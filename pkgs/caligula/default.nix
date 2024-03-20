{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "caligula";
  version = "main";

  src = fetchFromGitHub {
    owner = "ifd3f";
    repo = pname;
    rev = version;
    hash = "" ;
  };

 #     nativeBuildInputs = [ pkgs.pkg-config ];
	# buildInputs = [ pkgs.openssl ];
    cargoHash = "";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
