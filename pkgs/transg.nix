{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.transg-tui.homeManagerModules.default ];

  packages.transgression-tui = {
    enable = true;
  };
}
