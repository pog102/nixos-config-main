{ config, pkgs, ... }:
let
icon_dir=".local/share/icons/walcons";
cur_color="#${config.colorScheme.colors.base06}";
in
{

	# home.file."${icon_dir}" = {
	# 	recursive = true;
	# 	source = ../pkgs/walcons;
	# };
	home.file."${icon_dir}/sun.svg".text = 
		''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>brightness-7</title><path d="M12,8A4,4 0 0,0 8,12A4,4 0 0,0 12,16A4,4 0 0,0 16,12A4,4 0 0,0 12,8M12,18A6,6 0 0,1 6,12A6,6 0 0,1 12,6A6,6 0 0,1 18,12A6,6 0 0,1 12,18M20,8.69V4H15.31L12,0.69L8.69,4H4V8.69L0.69,12L4,15.31V20H8.69L12,23.31L15.31,20H20V15.31L23.31,12L20,8.69Z" fill="${cur_color}"/></svg>
		'';


	home.file."${icon_dir}/sun_half.svg".text = 
		''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,18V6A6,6 0 0,1 18,12A6,6 0 0,1 12,18M20,15.31L23.31,12L20,8.69V4H15.31L12,0.69L8.69,4H4V8.69L0.69,12L4,15.31V20H8.69L12,23.31L15.31,20H20V15.31Z" fill="${cur_color}"/></svg>
		'';
	home.file."${icon_dir}/sun_emp.svg".text = 
		''
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,18A6,6 0 0,1 6,12A6,6 0 0,1 12,6A6,6 0 0,1 18,12A6,6 0 0,1 12,18M20,15.31L23.31,12L20,8.69V4H15.31L12,0.69L8.69,4H4V8.69L0.69,12L4,15.31V20H8.69L12,23.31L15.31,20H20V15.31Z" fill="${cur_color}"/></svg>

		'';
	home.file."${icon_dir}/sun_low.svg".text = 
		''
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,18C11.11,18 10.26,17.8 9.5,17.45C11.56,16.5 13,14.42 13,12C13,9.58 11.56,7.5 9.5,6.55C10.26,6.2 11.11,6 12,6A6,6 0 0,1 18,12A6,6 0 0,1 12,18M20,8.69V4H15.31L12,0.69L8.69,4H4V8.69L0.69,12L4,15.31V20H8.69L12,23.31L15.31,20H20V15.31L23.31,12L20,8.69Z" fill="${cur_color}"/></svg>

		'';
	home.file."${icon_dir}/volumed.svg".text = 
		''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>volume-minus</title><path d="M3,9H7L12,4V20L7,15H3V9M14,11H22V13H14V11Z" fill="${cur_color}"/></svg>

		'';

	home.file."${icon_dir}/volumei.svg".text = 
		''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>volume-plus</title><path d="M3,9H7L12,4V20L7,15H3V9M14,11H17V8H19V11H22V13H19V16H17V13H14V11Z" fill="${cur_color}"/></svg>

		'';
}
