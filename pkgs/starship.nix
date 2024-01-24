{ config, pkgs, ... }:

{
    

    programs.starship.enable = true;
    programs.starship.settings = {

format="$directory$git_branch$character";
right_format = "$git_status$cmd_duration";
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
