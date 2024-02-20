{ userSettings, config, pkgs,inputs, ... }:

{
# packages.neofetch.enable = true;
	home.packages = [pkgs.neofetch];

	
	home.file.".config/neofetch/chad.txt" = {
		recursive = true;
		source = ../chad2.txt;
	};
	home.file.".config/neofetch/config.conf".text = 
		''
		print_info() {
    prin "​ ​​ $(color 6)  ​​ ​コンピューター" 
    prin "$(color 16)┌──────────────────────────────────────────────┐" 
    info "​ ​ ​​$(color 1)  OS          " distro  
    info "​ ​​ ​$(color 1)  Kernel      " kernel 
    info "​ ​​ ​$(color 2) 󰏓 Packages    " packages 
    info "​ ​​ ​$(color 2)  Shell       " shell 
    info "​ ​​ ​$(color 2) 󰍹 Resolution  " resolution 
    info "​ ​​ ​$(color 3) 󰘔 DE          " de 
    info "​ ​​ ​$(color 3)  Terminal    " term 
    # info "​ ​​ ​$(color 3)  Theme       " theme 
    prin "​ ​​ ​$(color 3)  Theme       " ${userSettings.theme}
    prin "$(color 16)└──────────────────────────────────────────────┘" 
    prin " " 
    info "​ ​​ ​​​ $(color 6) " title
    prin "$(color 16)┌──────────────────────────────────────────────┐"
    info "​ ​​ ​$(color 12)  CPU         " cpu 
    info "​ ​​ ​$(color 12)  GPU         " gpu 
    info "​ ​​ ​$(color 13)  GPU Driver  " gpu_driver
    info "​ ​​ ​$(color 13) 󰍛﬙ Memory      " memoy
    prin "$(color 16)└──────────────────────────────────────────────┘" 
    prin " " 
    prin "​ ​​ ​​ ​​$(color 1)​ ​​ ​​$(color 2)​ ​​ ​​$(color 3)​ ​​ ​​$(color 4)​ ​​ ​​$(color 5)​ ​​ ​​$(color 6)​ ​​ ​​$(color 7)​ ​​ ​​$(color 8)​ ​​ ​​$(color 16)"
}
title_fqdn="off"
kernel_shorthand="on"
distro_shorthand="off"
os_arch="on"
uptime_shorthand="on"
memory_percent="off"
memory_unit="mib"
package_managers="on"
shell_path="off"
shell_version="on"
speed_type="bios_limit"
speed_shorthand="off"
cpu_brand="on"
cpu_speed="on"
cpu_cores="logical"
cpu_temp="off"
gpu_brand="on"
gpu_type="all"
refresh_rate="on"
gtk_shorthand="off"
gtk2="on"
gtk3="on"
public_ip_host="http://ident.me"
public_ip_timeout=2
de_version="on"
disk_show=('/')
disk_subtitle="mount"
disk_percent="on"
music_player="auto"
song_format="%artist% - %album% - %title%"
song_shorthand="off"
mpc_args=()
colors=(distro)
bold="on"
underline_enabled="on"
underline_char="-"
separator=":"
block_range=(0 15)
color_blocks="on"
block_width=3
block_height=1
col_offset="auto"
bar_char_elapsed="-"
bar_char_total="="
bar_border="on"
bar_length=15
bar_color_elapsed="distro"
bar_color_total="distro"
cpu_display="off"
memory_display="off"
battery_display="off"
disk_display="off"
image_backend="chafa"
# image_source="$HOME/.local/share/icons/arch.png"
image_source="$HOME/.config/neofetch/chad.txt"
ascii_distro="auto"
ascii_colors=(distro)
ascii_bold="on"
image_loop="off"
crop_mode="normal"
crop_offset="west"
image_size="28%"
gap=1
yoffset=0
xoffset=0
background_color=
stdout="off"
		'';


}
