{ config, pkgs, ... }:

{
    

    programs.starship.enable = true;
    programs.starship.settings = {

# Prompt symbols 
character = {
  success_symbol = "[](#a6e3a1 bold)";
  error_symbol = "[](#f38ba8)";
  vicmd_symbol = "[](#f9e2af)";
};
directory = {
	substitutions = {
	" ~/Pictures" = "  Pictures";
	" ~/.config" = " config";
	" ~/Downloads" = " Downloads";
	 "~" = " ~";
 
	};
  format = "[]($style)(bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[$path](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)[ ]($style)";
  # format = "[]($style)[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[$path](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)[ ]($style)";
  style = "bg:none fg:#${config.colorScheme.colors.base01}";
  truncation_length = 3;
  truncate_to_repo=false;
};

git_branch = {
  format = "[]($style)[[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)$branch](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
  style = "bg:none fg:#${config.colorScheme.colors.base01}";
};
git_status = {
# $all status$ahead_behind
format = "[]($style)[$all_status$ahead_behind](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
# format = "[$all_status$ahead_behind]($style)";
modified = "[󰏬 $count](fg:#FFD700 bg:#${config.colorScheme.colors.base01})";
staged = "[ $count](fg:#228B22 bg:#${config.colorScheme.colors.base01})";
deleted = "[ $count](fg:#DE3163 bg:#${config.colorScheme.colors.base01})";
up_to_date = "";
style = "bg:none fg:#${config.colorScheme.colors.base01}";
};
cmd_duration = {
  min_time = 1;
# duration & style 
format = "[]($style)[[ ](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06} bold)$duration](bg:#${config.colorScheme.colors.base01} fg:#${config.colorScheme.colors.base06})[ ]($style)";
disabled = false;
style = "bg:none fg:#${config.colorScheme.colors.base01}";

};


format="$directory$git_branch$character";
right_format = "$git_status$cmd_duration";
add_newline = false ;
c.disabled = true;
cmake.disabled = true;
haskell.disabled = true;
python.disabled = true;
ruby.disabled = true;
rust.disabled = true;
perl.disabled = true;
# custom.nix = {
# # command = 'echo foo' # shows output of command
# detect_files = "['flake.nix']"; # can specify filters but wildcards are not supported
# # when = ''' test "$HOME" = "$PWD" '''
# format = "[nix]($style)";
#
#
#
# };
package.disabled = true;
lua.disabled = true;
nodejs.disabled = true;
java.disabled = true;
golang.disabled = true;
conda = {
format = " [$symbol$environment](dimmed green) ";
};

git_status = {
conflicted = "=";
ahead =	"⇡\${count}";
behind = "⇣\${count}";
diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
untracked = "?\${count}";
stashed = "stash";
renamed = "»\${count}";

};




  
};
}
