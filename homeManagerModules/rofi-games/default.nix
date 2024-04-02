{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "rofi-games";
  version = "v1.6.7";
# cargoLock = {
#     lockFile = ./Cargo.lock;
#   };
  src = fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = pname;
    rev = version;
    hash = "sha256-4+QcQATBNfYqwqTIkwlfC7aVcsNuTeD3ApIJpN/q/4s=" ;
  };
 cargoLock = {
    lockFile = ./Cargo.lock;
  };
    # cargoHash = "";
  #    cargoLock = {
  #   lockFile = "${src}/Cargo.lock";
  # };


  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
