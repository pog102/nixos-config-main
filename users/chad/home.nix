{ userSettings, inputs, config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.
	home.username = "chad";
	home.homeDirectory = "/home/chad";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
	home.stateVersion = "23.11"; # Please read the comment before changing.
		imports = [
		(if userSettings.theme == "wal" then 
		../../pkgs/pywal/pywal.nix 
		else 
		../../pkgs/color.nix
		)
			../../pkgs/wm/hyprland.nix
			../../pkgs/editor/nvim.nix
			../../pkgs/shell/zsh.nix
			../../pkgs/git.nix
			# ../../pkgs/dunst.nix
			../../pkgs/term/foot.nix
			../../pkgs/wlsunset.nix
			../../pkgs/mpv/mpv.nix
			# ../../pkgs/btop.nix
			../../pkgs/cursor.nix
			../../pkgs/ayurs/ags.nix
			# ../../pkgs/transg.nix
			../../pkgs/firefox/firefox.nix
			../../pkgs/wallpaper/wallpaper.nix
		] ;
# The home.packages option allows you to install Nix packages into your
# environment.

	fonts.fontconfig.enable = true;

	home.packages = with pkgs; [
#      zsh-history-substring-search
		lsd
		bat
		bat-extras.batman
		bat-extras.prettybat
		pamixer
		chafa
		ripgrep
		sassc
		fzf
		# papirus-icon-theme
		libnotify
		imv
		swww
		neofetch
			tree
			wl-clipboard


			nerdfonts
			dejavu_fonts
			liberation_ttf
			fira-code
			fira-code-symbols
			  (pkgs.writeShellScriptBin "transadd" ''
       #!/bin/sh
       transmission-remote -U --add "$@" && notify-send "Transmission" "Torrent added."
    '')
			   (pkgs.makeDesktopItem {
      name = "torrent";
      desktopName = "Torrent";
      exec = "transadd  %U";
      terminal = false;
      type = "Application";
      mimeTypes = ["application/x.bittorrent"
		"x-scheme-handler/magnet"
      ];
    })
#  firefox
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
			];
			 # ++ (if userSettings.wal then [pkgs.pywall] else []);

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
	home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
	};

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. If you don't want to manage your shell through Home
# Manager then you have to manually source 'hm-session-vars.sh' located at
# either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/chad/etc/profile.d/hm-session-vars.sh
#
	home.sessionVariables = {
	};
	 xdg.enable = true;
	 xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
    xdg.mimeApps.associations.added = {
  "application/x.bittorrent" ="torrent.desktop";
"x-scheme-handler/magnet"="torrent.desktop";

  };


# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
