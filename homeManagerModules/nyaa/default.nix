{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "nyaa";
  version = "main";

  src = fetchFromGitHub {
    owner = "Beastwick18";
    repo = pname;
    rev = version;
    # hash = "sha256-h2jpZ4l627g3L5lwUwhcQnRVqSHQVMfnQrkoCJ9n2Gk=" ;
    hash = "sha256-SVL81RSrc3HGVkSghlQUvZzqZctfwWFSENkPWCo6upA=";

  };

  # cargoHash = "sha256-gU1hzzGV/Gdg6LnHRzZlGfSwxG28bXw/PTx5xoaW+RQ=";
  cargoHash = "sha256-XuzfQJCAGZ/wx4jegRK0DG031n3Y52VOCDabaj5Axno=";


  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
