{ lib, config, pkgs, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enable git file";
  };
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        # Automatically track remote branch
        push.autoSetupRemote = true;
      };
      aliases = {
        # a = "!git add -A && git commit -m 'Added some stuff' && git push";
        co = "checkout";
        s = "status";
      };
      userName = "Ernestas Damanskis";
      userEmail = "ernestasdamanskis@gmail.com";
    };
  };
}
