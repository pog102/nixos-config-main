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

create = ''
''${{
printf "file: "
read file && lf -remote "$open $file"
}}
'';
};
 keybindings = {

      "\\\"" = "";
      o = "";
      m = "mkdir";
      c = "create";
      e = "read";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      do = "dragon-out";
      D="delete";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
	r=":rename; cmd-delete-home"	;
      # ...
      extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
	# notify-send "$1"
        # chafa -f sixel --animate off --polite on "$1"
        exit 1
        ;;
	*)
				bat --color=always --style=plain --pager=never "$1"
		;;
	esac

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
      sixel=true;
      icons = true;
      ignorecase = true;
    };
};
}

