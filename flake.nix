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
     nix-colors.url = "github:misterio77/nix-colors";
      firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 #        ags = {
	# url = "github:Aylur/ags";
 #      inputs.nixpkgs.follows = "nixpkgs";
 #  };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      userSettings = rec {
      wal = false;
      name = "chad";
      };
    in
    {
    
      nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
          modules = [ 
            ./users/chad/configuration.nix
             inputs.home-manager.nixosModules.default
          ];
          specialArgs = {
	  inherit inputs;
	    inherit userSettings;
	  };
        };
	};

    };
}
