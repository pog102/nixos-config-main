{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "rofi-games";
  version = "main";

  src = fetchFromGitHub {
    owner = "Apneseth";
    repo = pname;
    rev = version;
    hash = "" ;
  };

    cargoHash = "";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
