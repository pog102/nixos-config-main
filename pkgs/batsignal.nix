{ config, pkgs, ... }:
{
services.batsignal = {

	enable=true;
	extraArgs=[
"-e"
"-I sun"


	];
};
}

