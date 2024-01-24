{ config, lib, pkgs, ... }:

{
  programs.pywal= {
  enable = true;
};
   home.file.".config/wal/templates" = {
     recursive = true;
     source = ./template;
   };

}
