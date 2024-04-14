{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "rofi-games";
  version = "main";
  # cargoLock = {
  #     lockFile = ./Cargo.lock;
  #   };
  src = fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = pname;
    rev = version;
    hash = "";
  };
  cargoHash = "";
  #    cargoLock = {
  #   lockFile = "${src}/Cargo.lock";
  # };


}
