install(){
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
}
sudo nixos-rebuild --switch --flake .#default

#home-manager switch --flake .#user