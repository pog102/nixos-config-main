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
      extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''

case "$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')" in
  	*.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.tiff|*.gif|*.jfif|*.ico)
	geometry="$(($2-2))x$3"
	chafa "$1" -f sixel -s "$geometry" --animate false
	;;
	*)
				bat --color=always --style=plain --pager=never "$1"
		;;
	esac
exit 0

      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.chafa}/bin/chafa --clear  < /dev/null > /dev/tty
      '';
    in
    ''
      # set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
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

