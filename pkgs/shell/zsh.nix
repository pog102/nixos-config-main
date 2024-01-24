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
    bindkey '^[[A' history-substring-search-up # or '\eOA'
 bindkey '^[[B' history-substring-search-down # or '\eOB'
# HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

    # PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
    #  %F{green}→%f "
    # RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    # [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    '';
    profileExtra = "if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then Hyprland; fi";
    plugins = [
    {
       name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
      owner = "zsh-users";
    repo = "zsh-history-substring-search";
    rev = "v1.1.0";
    sha256 = "0vjw4s0h4sams1a1jg9jx92d6hd2swq4z908nbmmm2qnz212y88r";
    };
    }

    # {
    #   # will source zsh-autosuggestions.plugin.zsh
    #   name = "zsh-autosuggestions";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "zsh-users";
    #     repo = "zsh-autosuggestions";
    #     rev = "v0.4.0";
    #     sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
    #   };
    # }
   ];
  };

  # home.packages = with pkgs; [
  #     zsh-history-substring-search
  #     ];
}
