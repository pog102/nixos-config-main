#install(){
#nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
#nix-channel --update
#nix-shell '<home-manager>' -A install
#}
#sudo nixos-rebuild switch --show-trace --flake .#default
# NOTE
# u can also sudo nixos-rebuild switch --flake github:pog102/nixos-config-main#default
#
#
if [ "$1" == "c" ]
then
sudo nix-env --delete-generations old
sudo nix-collect-garbage -d
nix-collect-garbage -d
sudo nix-store --gc
elif [ "$1" == "b" ]
then
sudo nix build .#nixosConfigurations.iso.config.system.build.isoImage
else
if ! cmp --silent ./users/chad/hardware-configuration.nix /etc/nixos/hardware-configuration.nix ;then
	sudo cp /etc/nixos/hardware-configuration.nix ./users/chad/hardware-configuration.nix
fi
sudo nixos-rebuild switch --flake .#default 
fi
#home-manager switch --flake .#user
