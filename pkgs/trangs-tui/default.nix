{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "transg-tui";
  version = "master";

  src = fetchFromGitHub {
    owner = "PanAeon";
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
