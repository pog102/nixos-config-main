{ pkgs, ... }:

pkgs.writeShellScript "wallp" ''
#!/bin/sh

wp_dir="$HOME/Pictures"
# wp_dir="$HOME/new"

list_wps() {
  find "$wp_dir" -regex '.*\(jpg\|jpeg\|png\)' -printf "%P\n" |shuf |
    while read wp; do
      echo -en "$wp\x00icon\x1f$wp_dir/$wp\n";
    done
}

rofi_dmenu() {
  # handwriting fonts: caveat #1 swankyandmoomoo #2 longcang #3
  rofi -dmenu -show-icons \
    -theme-str '#entry { placeholder: "Wallpaper to apply.."; }' \
    -theme wall
}

wp=$( list_wps | rofi_dmenu )

[ ! -z $wp ] && wal -n -q -i "$wp_dir/$wp" && swww img "$wp_dir/$wp" && pkill dunst && pkill -SIGUSR2 waybar

''
