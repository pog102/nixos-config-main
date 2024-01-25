{ config, pkgs, ... }:

{

programs.mpv = {
  enable = true;
};
nixpkgs.overlays = [
  (self: super: {
    mpv = super.mpv.override {
      scripts = [ self.mpvScripts.mpv_thumbnail_script ];
    };
  })
];
}
