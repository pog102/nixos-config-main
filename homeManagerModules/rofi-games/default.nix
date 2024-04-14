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
    hash = "sha256-YsrckS89riQgW4xGcSwQUeRQileOldMTXPICsaLOfbk=";
  };
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    glib
    cairo
    pango
  ];
  # cargoBuildFlags = [ "RUSTFLAGS=\"--cfg rofi_next\"" ];
  cargoHash = "sha256-MPg7/Er69KAvNF1eGjj5CLczhgJtY6sKqGSmu7cCrjA=";
  #    cargoLock = {
  #   lockFile = "${src}/Cargo.lock";
  # };


}
