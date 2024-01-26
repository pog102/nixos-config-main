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
      name = "notify";
      src = pkgs.fetchFromGitHub {
        owner = "marzocchi";
        repo = "zsh-notify";
        rev = "v1.0";
        sha256 = "sha256-d0MD3D4xiYVhMIjAW4npdtwHSobq6yEqyeSbOPq3aQM=";
      };
    }
   ];


  };

  # home.packages = with pkgs; [
  #     zsh-history-substring-search
  #     ];
}
