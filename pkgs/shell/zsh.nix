{ config, pkgs, ... }:

{

  programs = {

    autojump = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      history.ignoreAllDups = true;
      shellAliases = {
        ll = "ls -l";
        n = "nvim";
        trans = "transgression-tui";
        ssh = "TERM=linux ssh";
        man = "batman";
        fman = "man -H$BROWSER";
        cat = "prettybat";
        less = "prettybat";
        gc = "git add -A && git commit -m \"$(date +\'%m-%d %H:%M\')\" && git push";
        ls = "lsd";
        neo = "neo -D";
        mom = "ssh chad@192.168.1.87";
        up = "sudo nixos-rebuild switch --flake .#default";
      };
      initExtraFirst = ''
           export AUTO_NOTIFY_IGNORE=("mpv" "firefox" "n" "btop" "man" "bat")
        export AUTO_NOTIFY_TITLE=" : %command"
        export AUTO_NOTIFY_BODY="󱎫 : %elapsed s"



        # Zsh Options
        setopt AUTOCD              # change directory just by typing its name
        setopt PROMPT_SUBST        # enable command substitution in prompt
        setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
        setopt LIST_PACKED		   # The completion menu takes less space.
        setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
        setopt HIST_IGNORE_DUPS	   # Do not write events to history that are duplicates of previous events
        setopt HIST_FIND_NO_DUPS   # When searching history don't display results already cycled through twice
        setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

        autoload -U compinit

        zstyle ':completion:*' verbose true
        zstyle ':completion:*:*:*:*:*' menu select
        zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
        zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}'


        # zmodload zsh/complist
        # compinit
        # _comp_options+=(globdots)	


           if [ ! -f /tmp/.neofetch ]; then
          touch /tmp/.neofetch
          neofetch
        fi
        # HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

            # PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
            #  %F{green}→%f "
            # RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
            # [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      '';
      profileExtra = "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then Hyprland; fi";
      plugins = [

        # {
        #    name = "zsh-history-substring-search";
        #   src = pkgs.fetchFromGitHub {
        #   owner = "zsh-users";
        # repo = "zsh-history-substring-search";
        # rev = "v1.1.0";
        # sha256 = "0vjw4s0h4sams1a1jg9jx92d6hd2swq4z908nbmmm2qnz212y88r";
        # };
        # }

        # {
        #   # will source zsh-autosuggestions.plugin.zsh
        #   name = "auto-notify";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "MichaelAquilina";
        #     repo = "zsh-auto-notify";
        #     rev = "0.8.1";
        #     sha256 = "sha256-4PH7g7OY5hASgq4xdswYaCDnys4pz/wyIVkGgaPcgBI=";
        #   };
        # }
      ];


      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch = {
        enable = true;
        searchDownKey = [
          "$terminfo[kcud1]"
        ];
        searchUpKey = [
          "$terminfo[kcuu1]"

        ];
        # searchDownKey=
      };
    };
  };
  # home.packages = with pkgs; [
  #     zsh-history-substring-search
  #     ];
}
