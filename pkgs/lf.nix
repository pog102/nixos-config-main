{ config, pkgs, ... }:
{
  xdg.configFile."lf/icons".source = ../icons;
programs.lf = {
enable=true;
commands = {
editor-open = ''$$EDITOR $f'';
mkdir = ''
''${{
	clear
printf "mkdir: "
read DIR
mkdir $DIR
  lf -remote "send $id select $DIR"
}}
'';
open = ''
''${{
    case $(file --mime-type -Lb $f) in
        text*|inode*) lf -remote "send $id \$$EDITOR \$fx";;
        *) for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done;;
    esac
}}


'';
create = ''
''${{
clear
  printf "File Name: "
  read ans
  case $ans in
   *nix)
	cp ~/.config/nvim/templates/skel.nix $ans
      ;;
   *sh)
	cp ~/.config/nvim/templates/skeleton.sh $ans
      ;;
   *)
  	touch $ans
     ;;
esac

  lf -remote "send $id select $ans"
  # lf -remote "send $id open"
}}
'';
};
 keybindings = {

      "\\\"" = "";
      o = "";
      m = "mkdir";
      c = "create";
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
        # chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
        chafa -s "$2x$3" --animate off --polite on "$1"
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

