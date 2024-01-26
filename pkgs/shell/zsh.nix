{ config, pkgs, ... }:

{

programs.zsh = {
  enable = true;
   enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  shellAliases = {
    ll = "ls -l";
    n = "nvim";
    ls = "lsd";
    up = "sudo nixos-rebuild switch --flake .#default";
  };
   initExtra = ''
   export AUTO_NOTIFY_IGNORE=("mpv" "firefox" "n")
export AUTO_NOTIFY_TITLE="%command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds"
autoload -U compinit

 zstyle ':completion:*' menu select
 zstyle ':completion:*' list-colors 
 zstyle ':completion:*' list-colors "$${(s.:.)LS_COLORS}"
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)	


   if [ ! -f /tmp/.neofetch ]; then
  touch /tmp/.neofetch
  neofetch
fi
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
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

    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "auto-notify";
      src = pkgs.fetchFromGitHub {
        owner = "MichaelAquilina";
        repo = "zsh-auto-notify";
        rev = "0.8.1";
        sha256 = "sha256-4PH7g7OY5hASgq4xdswYaCDnys4pz/wyIVkGgaPcgBI=";
      };
    }
   ];


  };

  # home.packages = with pkgs; [
  #     zsh-history-substring-search
  #     ];
}
