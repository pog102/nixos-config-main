{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "transg-tui";
  version = "master";

  src = fetchFromGitHub {
    owner = "PanAeon";
    repo = pname;
    rev = version;
    hash = "sha256-hq3uDajewxf9avtGR0iuJeliyv+r4Et/GAjnBlHpb4c=";
  };

  # buildInputs = [ openssl.dev pkg-config ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];
  cargoHash = "sha256-Vscwlx4RtSNmx76ay0faquZ30b+/3FUQe5LX1Az/qSg=";
  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
