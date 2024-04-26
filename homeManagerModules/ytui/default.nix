{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "ytui-music";
  # version = "main";
  version = "v2.0.0-rc1";
  # version = "0x00007f0bd4c9b558";
  # version = "refs/tags/main.zip";

  src = fetchFromGitHub {
    owner = "sudipghimire533";
    repo = pname;
    rev = version;
    hash = "sha256-f/23PVk4bpUCvcQ25iNI/UVXqiPBzPKWq6OohVF41p8=";
  };
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];
  cargoHash = "sha256-ckpqq2XK/OhKWspL55/h0ZpwPZb3iQtoTUEoKNTjap8=";

}
