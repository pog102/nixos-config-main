{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "ytui-music";
  version = "main";

  src = fetchFromGitHub {
    owner = "sudipghimire533";
    repo = pname;
    rev = version;
    hash = "";
  };

  #     nativeBuildInputs = [ pkgs.pkg-config ];
  # buildInputs = [ pkgs.openssl ];
  cargoHash = "";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
