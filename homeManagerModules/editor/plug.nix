{ pkgs, ... }:

rec {
  nixpkgs = {
    overlays = [
      (self: super:
        let
          vim-better-whitespace = super.vimUtils.buildVimPlugin {
            name = "vim-better-whitespace";
            src = pkgs.fetchFromGitHub {
              owner = "ntpeters";
              repo = "vim-better-whitespace";
              rev = "984c8da518799a6bfb8214e1acdcfd10f5f1eed7";
              sha256 = "10l01a8xaivz6n01x6hzfx7gd0igd0wcf9ril0sllqzbq7yx2bbk";
            };
          };
        in
        {
          vimPlugins =
            super.vimPlugins // { inherit vim-better-whitespace; };
        }
      )
    ];
  };

  # programs.home-manager = {
  #   enable = true;
  #   path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  # };

  programs.nixvim = {
    plugins = [
      # Defined here: pkgs/misc/vim-plugins/default.nix
      "vim-better-whitespace"
    ];
  };
}
