{
  description = "Nixos config flake";

  inputs = {
  #  nixpkgsops-nix.url = "github:Mic92/sops-nix";s.url = "github:nixos/nixpkgs/nixos-23.11";
sops-nix.url = "github:Mic92/sops-nix";
nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
# nixos.url = "nixpkgs/23.11-beta";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";

  };
  grub-theme.url = "github:Lxtharia/minegrub-theme";
  nix-colors.url = "github:misterio77/nix-colors";
  firefox-addons = {
    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  #       ags = {
  #       url = "github:Aylur/ags";
  #     inputs.nixpkgs.follows = "nixpkgs";
  # };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    userSettings = rec {
      # theme = "wal";
 # theme = "tokyo-night-dark";
 	# theme="gruvbox-dark-medium";
 	# theme="pasque";
 	# theme="eva";
	 # theme="tokyodark"; 
 	 theme="catppuccin-frappe";
      # name = "chad";
    };
  in
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        modules = [ 
          inputs.grub-theme.nixosModules.default
          ./users/chad/configuration.nix
          inputs.home-manager.nixosModules.default
	  # inputs.transg-tui
	  # ./pkgs/transg.nix
	  {
	  home-manager.extraSpecialArgs = {
          inherit userSettings;
	  };
	  }
        ];
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };

   #    exampleIso = nixpkgs.lib.nixosSystem {
   #      system = "x86_64-linux";
   #      modules = [
   #        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
   #        # ({ pkgs, ... }: {
   #        #   environment.systemPackages = [ pkgs.neovim ];
			#
   #        # })
	  #           inputs.grub-theme.nixosModules.default
   #        ./users/chad/configuration.nix
   #        inputs.home-manager.nixosModules.default
	  # {
	  # home-manager.extraSpecialArgs = {
   #        inherit userSettings;
	  # };
	  # }
			#
   #      ];
			#
   #      specialArgs = {
   #        inherit inputs;
   #        inherit userSettings;
   #      };
   #    };
    };



  };
}
