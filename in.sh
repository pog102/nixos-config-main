#install(){
#nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
#nix-channel --update
#nix-shell '<home-manager>' -A install
#}
#sudo nixos-rebuild switch --show-trace --flake .#default 
#
#
if ! $(cmp --silent ./users/chad/hardware-configuration.nix /etc/nixos/hardware-configuration.nix);then
	sudo cp /etc/nixos/hardware-configuration.nix ./users/chad/hardware-configuration.nix
fi
sudo nixos-rebuild switch --flake .#default 

#home-manager switch --flake .#user
