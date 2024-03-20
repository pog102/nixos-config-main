{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "nyaa";
  version = "v0.6.3";

  src = fetchFromGitHub {
    owner = "Beastwick18";
    repo = pname;
    rev = version;
    hash = "sha256-wq4oD6GV7xi58Y6WHcnfUg9hV3ClSS5NF4tRyrviveE=" ;
  };

    cargoHash = "sha256-2NwrMrQ/hYObU3aICgwn5+D0tm+aBImMi+7Fz0QHlso=";

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
