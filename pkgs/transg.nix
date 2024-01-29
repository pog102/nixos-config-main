{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ 
  # inputs.grub-theme.nixosModules.default
  inputs.transg-tui.apps.default ];

  # packages.transgression-tui = {
  #   enable = true;
  # };
}
