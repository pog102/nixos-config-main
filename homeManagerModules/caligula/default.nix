{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "caligula";
  version = "main";

  src = fetchFromGitHub {
    owner = "ifd3f";
    repo = pname;
    rev = version;
    hash = "sha256-06rD3sIV0CmaEQmLj4eByH4DAGqenufWUz2Gw0JOMi8=" ;
  };

 #     nativeBuildInputs = [ pkgs.pkg-config ];
	# buildInputs = [ pkgs.openssl ];
    cargoHash = "sha256-znk7vVIM3F0Pg655FRo0THTrkf674W6mMldZSNqTFfs=";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
