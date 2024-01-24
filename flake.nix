{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     nixvim = {
	url = "github:nix-community/nixvim";
       inputs.nixpkgs.follows = "nixpkgs";

     };
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
    in
    {
    
      nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./users/chad/configuration.nix
             inputs.home-manager.nixosModules.default
          ];
        };
	};

    };
}
