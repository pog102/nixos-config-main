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
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    '';
  };

}
