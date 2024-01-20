{
  description = "Flake of LibrePhoenix";

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs, stylix,
              blocklist-hosts, rust-overlay, hyprland-plugins,
              eaf, eaf-browser, org-nursery, org-yaap,
              org-side-tree, org-timeblock, phscroll, ... }@inputs:
  let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "omega"; # hostname
      profile = "personal"; # select a profile defined from my profiles directory
      timezone = "America/Chicago"; # select timezone
      locale = "en_US.UTF-8"; # select locale
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "chad"; # username
      name = "Chad"; # name/identifier
      email = "ernestasdas@librephoenix.com"; # email (used for certain configurations)
      dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
      theme = "uwunicorn-yt"; # selcted theme from my themes directory (./themes/)
      wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      # window manager type (hyprland or x11) translator
      wmType = if (wm == "hyprland") then "wayland" else "x11";
      browser = "firefox"; # Default browser; must select one from ./user/app/browser/
      defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
      term = "foot"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      fontPkg = pkgs.intel-one-mono; # Font package
      editor = "nixvim"; # Default editor;
      # editor spawning translator
      # generates a command that can be used to spawn editor inside a gui
      # EDITOR and TERM session variables must be set in home.nix or other module
      # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
      spawnEditor = if (editor == "emacsclient") then "emacsclient -c -a 'emacs'"
                    else (if ((editor == "nixvim") || (editor == "nvim") || (editor == "nano")) then "exec " + term + " -e " + editor else editor);
    };


    # create patched nixpkgs
    nixpkgs-patched = (import nixpkgs { system = systemSettings.system; }).applyPatches {
      name = "nixpkgs-patched";
      src = nixpkgs;
      patches = [
                  ./patches/emacs-no-version-check.patch
                  ./patches/nixos-nixpkgs-268027.patch
                ];
    };

    # configure pkgs
    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = { allowUnfree = true;
               };
    };

    # configure lib
    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/home.nix") # load home.nix from selected PROFILE
                    #  inputs.nix-flatpak.homeManagerModules.nix-flatpak # Declarative flatpaks
                    ];
          extraSpecialArgs = {
            # pass config variables from above
            inherit systemSettings;
            inherit userSettings;
            inherit (inputs) nix-doom-emacs;
            inherit (inputs) eaf;
            inherit (inputs) eaf-browser;
            inherit (inputs) org-nursery;
            inherit (inputs) org-yaap;
            inherit (inputs) org-side-tree;
            inherit (inputs) org-timeblock;
            inherit (inputs) phscroll;
            #inherit (inputs) nix-flatpak;
            inherit (inputs) stylix;
            inherit (inputs) hyprland-plugins;
          };
      };
    };
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/configuration.nix") ]; # load configuration.nix from selected PROFILE
        specialArgs = {
          # pass config variables from above
          inherit systemSettings;
          inherit userSettings;
          inherit (inputs) stylix;
          inherit (inputs) blocklist-hosts;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-doom-emacs.url = "github:librephoenix/nix-doom-emacs?ref=pgtk-patch";
    eaf = {
      url = "github:emacs-eaf/emacs-application-framework";
      flake = false;
    };
    eaf-browser = {
      url = "github:emacs-eaf/eaf-browser";
      flake = false;
    };
    org-nursery = {
      url = "github:chrisbarrett/nursery";
      flake = false;
    };
    org-yaap = {
      url = "gitlab:tygrdev/org-yaap";
      flake = false;
    };
    org-side-tree = {
      url = "github:localauthor/org-side-tree";
      flake = false;
    };
    org-timeblock = {
      url = "github:ichernyshovvv/org-timeblock";
      flake = false;
    };
    phscroll = {
      url = "github:misohena/phscroll";
      flake = false;
    };

    stylix.url = "github:danth/stylix";

    rust-overlay.url = "github:oxalica/rust-overlay";

    #nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.2.0";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      flake = false;
    };
  };
}
