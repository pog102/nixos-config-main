{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    #sops-nix.url = "github:Mic92/sops-nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # transg-tui.url = "github:PanAeon/transg-tui";
    # nixos.url = "nixpkgs/23.11-beta";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";

      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
    trans = {
      url = "github:PanAeon/transg-tui";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caligula = {
      url = "github:ifd3f/caligula";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nyaa = {
      url = "github:Beastwick18/nyaa";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    # grub-theme.url = "github:Lxtharia/minegrub-theme";
    grub-theme.url = "github:vinceliuice/grub2-themes";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      userSettings = rec {
        theme = "wal";
        # theme = "tokyo-night-dark";
        # theme="gruvbox-dark-medium";
        # theme="pasque";
        # theme="eva";
        # theme="tokyodark"; 
        # theme="catppuccin-frappe";
        # name = "chad";
      };
    in
    {
      # inputs.transg-tui.apps.${system}.default = { type = "app"; program = "github:PanAeon/transg-tui";};
      # packages."${system}"."transg-tui"= derivation;
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {

          modules = [
            inputs.grub-theme.nixosModules.default
            ./hosts/chad/configuration.nix
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
        iso = nixpkgs.lib.nixosSystem {
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
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

        framework = nixpkgs.lib.nixosSystem {
          modules = [ ./users/chad/configuration.nix ];
          specialArgs = { inherit inputs; };
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
