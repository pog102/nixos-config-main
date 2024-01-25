{
  apps.default = {
    type = "app";
    program = "${swww}/bin/swww init &; ${swww}/bin/swww ~/Pictures/mist.png";
  };
}
