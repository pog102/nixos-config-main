{ pkgs,lib, fetchFromGitHub, rustPlatform, ... }:
{
pkgs.rustPlatform.buildRustPackage rec {
  pname = "nyaa";
  version = "v0.6.3";

  src = fetchFromGitHub {
    owner = "Beastwick18";
    repo = pname;
    rev = version;
    hash =lib.fakeHash;
  };

    cargoHash = lib.fakeHash;

  meta = {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/Beastwick18/nyaa";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
};
}
