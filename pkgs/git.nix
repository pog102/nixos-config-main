{ config, pkgs, ... }:

{

programs.git = {
  enable = true;
   aliases = {
      a = "!git add -A && git commit -m 'the usual' && git push";
      co = "checkout";
      s = "status";
    };
 userName = "Ernestas Damanskis";
 userEmail = "ernestasdamanskis@gmail.com";
};

}
