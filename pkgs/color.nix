{ inputs,config, pkgs, ... }:

{
imports = [
inputs.nix-colors.homeManagerModules.default
];
# colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

}
