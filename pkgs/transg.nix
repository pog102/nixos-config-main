{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ 
  # inputs.grub-theme.nixosModules.default
  inputs.transg-tui.nixosModules ];

  # packages.transgression-tui = {
  #   enable = true;
  # };
}
