{ config, pkgs, ... }:

{
    

    programs.starship.enable = true;
    programs.starship.settings = {

format="$directory$git_branch$character";
right_format = """$git_status$cmd_duration""";
add_newline = false ;
# "$schema" = '/home/chad/.cache/wal/colors.json'
# Other languages configurations:
c.disabled = true;
cmake.disabled = true;
haskell.disabled = true;
python.disabled = true;
ruby.disabled = true;
rust.disabled = true;
perl.disabled = true;
package.disabled = true;
lua.disabled = true;
nodejs.disabled = true;
java.disabled = true;
golang.disabled = true;




conda = {
format = " [$symbol$environment](dimmed green) ";
};
# Prompt symbols 
character = {
success_symbol = "[](#a6e3a1 bold)";
error_symbol = "[](#f38ba8)";
vicmd_symbol = "[](#f9e2af)";
};
directory = {
format = "[]($style)[ ](bg:#091234 fg:#9ad1dc)[$path](bg:#091234 fg:#1C9ACF bold)[ ]($style)";
style = "bg:none fg:#091234";
truncation_length = 3;
truncate_to_repo=false;
};

git_branch = {
format = "[]($style)[[ ](bg:#091234 fg:#A2DD9D bold)$branch](bg:#091234 fg:#2067AD)[ ]($style)";
style = "bg:none fg:#091234";
};
git_status = {
# $all status$ahead_behind
format = "[]($style)[$all_status$ahead_behind](bg:#091234 fg:#b4befe)[ ]($style)";
style = "bg:none fg:#091234";
conflicted = "=";
ahead =	"⇡${count}";
behind = "⇣${count}";
diverged = "⇕⇡${ahead_count}⇣${behind_count}";
up_to_date = "";
untracked = "?${count}";
stashed = "stash";
modified = "[󰏬 $count ](fg:#FFD700)";
staged = "[ $count ](fg:#228B22)";
renamed = "»${count}";
deleted = "[ $count ](fg:#DE3163)";
};
cmd_duration = {
min_time = 1;
# duration & style 
format = "[]($style)[[ ](bg:#091234 fg:#eba0ac bold)$duration](bg:#091234 fg:#1C9ACF)[ ]($style)";
disabled = false;
style = "bg:none fg:#091234";
};
  
};
}
