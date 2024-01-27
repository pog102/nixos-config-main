{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  #  nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";

  };
  transg-tui = {

  url = "github:PanAeon/transg-tui";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  grub-theme.url = "github:Lxtharia/minegrub-theme";
  nix-colors.url = "github:misterio77/nix-colors";
  firefox-addons = {
    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    inputs.nixpkgs.follows = "nixpkgs";
  };
        ags = {
        url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
  };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    userSettings = rec {
      theme = "wal";
      name = "chad";
    };
  in
  {

    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        modules = [ 
          inputs.grub-theme.nixosModules.default
          ./users/chad/configuration.nix
          inputs.home-manager.nixosModules.default
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
    };

  };
}
