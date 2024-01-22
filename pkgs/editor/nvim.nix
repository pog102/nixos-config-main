{ config, lib, pkgs, ... }:

{
programs.neovim = {
  enable = true;
  extraConfig = ''
    set number relativenumber
  '';
};
#environment.variables.EDITOR = "nvim";

  home.sessionVariables = {
EDITOR = "nvim";
  };
}
