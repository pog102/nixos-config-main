{ config, pkgs, ... }:
{
  xdg.configFile."lf/icons".source = ../icons;
programs.lf = {
enable=true;
commands = {
editor-open = ''$$EDITOR $f'';
mkdir = ''
''${{
printf "mkdir: "
read DIR
mkdir $DIR

}}
'';

};
 keybindings = {

      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      do = "dragon-out";
      
      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

      # ...
    };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
};
}

