{ userSettings, inputs, config, pkgs, ... }:
{
  home.username = "chad";
  home.homeDirectory = "/home/chad";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  imports = [
    ../../homeManagerModules
    # ./settings.nix
  ];

  pywal.enable = true;
  hyprland.enable = true;
  nvim.enable = true;
  transg.enable = true;
  nyaa.enable = true;
  zsh.enable = true;
  waybar.enable = true;
  git.enable = true;
  dunst.enable = true;
  neofetch.enable = true;
  foot.enable = true;
  lf.enable = true;
  wlsunset.enable = true;
  mpv.enable = true;
  rofi.enable = true;
  cursor.enable = true;
  firefox.enable = true;
  wallpaper.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    lsd
    xdg-utils
    bat
    # bun
    # neo
    gdu
    shellcheck
    # peaclock
    duf
    bat-extras.batman
    bat-extras.prettybat
    # nvtop-nvidia
    pamixer
    # # winePackages.wayland
    # # wineWowPackages.wayland
    # wineWowPackages.stable
    # winetricks
    # brightnessctl
    chafa
    # libsixel
    nixd
    nixpkgs-fmt
    lazygit
    ripgrep
    sassc
    fzf
    zip
    # rnix-lsp
    unzip
    libnotify
    swww
    grimblast
    file
    # discord
    # android-studio
    wl-clipboard
    papirus-icon-theme
    nerdfonts
    rustc
    cargo
    pkg-config
    # pandoc
    # texliveTeTeX
    #texliveFull
    # font-awesome
    dejavu_fonts
    liberation_ttf
    # ytui-music
    fira-code
    source-han-code-jp
    fira-code-symbols
    (pkgs.writeShellScriptBin "transadd" ''
      #!/bin/sh
      # transmission-remote -w "/home/chad/Downloads" -U --add "$@" && notify-send "Transmission" "Torrent added."
      transmission-remote -U --add "$@" && notify-send -i trans "Transmission" "Torrent added."
    '')
    # (pkgs.callPackage ../../pkgs/caligula/default.nix { })
    # (pkgs.callPackage ../../homeManagerModules/ytui/default.nix { })
    (pkgs.callPackage ../../homeManagerModules/rofi-games/default.nix { })

    (pkgs.makeDesktopItem {
      name = "torrent";
      desktopName = "Torrent";
      exec = "transadd  %U";
      terminal = false;
      noDisplay = true;
      type = "Application";
      mimeTypes = [
        "application/x.bittorrent"
        "x-scheme-handler/magnet"
      ];
    })



    # 		   (pkgs.makeDesktopItem {
    #      name = "shutdown";
    #      desktopName = "Shutdown";
    # comment="convenience app for rofi menu to shutdown the system";
    #      exec = "systemctl poweroff";
    #      terminal = true;
    # # noDisplay = true;
    #      type = "Application";
    # icon ="xfsm-shutdown";
    # categories= ["System"];
    #    })
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
    BROWSER = "firefox";
    THEME = "${userSettings.theme}";
  };
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    # templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    # secret_apps = "${config.home.homeDirectory}/.local/share/custom_apps";
    desktop = "${config.home.homeDirectory}/Desktop";
    publicShare = null;
    extraConfig = {
      # XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_SHOWS_DIR = "${config.home.homeDirectory}/Shows";
      # XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      # XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      # XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      # XDG_NOTES_DIR = "${config.home.homeDirectory}/Notes";
    };
  };
  xdg.desktopEntries =
    {
      rofi-theme-selector = {
        name = "Rofi Theme Selector";
        noDisplay = true;
        exec = "rofi-theme-selector";
      };
      "org.codeberg.dnkl.footclient" = {
        name = "Foot Client";
        noDisplay = true;
        exec = "footclient";
      };
      "org.codeberg.dnkl.foot-server" = {
        name = "Foot Server";
        noDisplay = true;
        exec = "foot --server";
      };
    };
  xdg.portal = {
    # wlr.enable = true;

    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/plain" = "nvim.desktop";
    "inode/x-empty" = "nvim.desktop";
    "application/json" = "nvim.desktop";
    "inode/directory" = "lf.desktop";
  };

  xdg.mimeApps.associations.added = {
    "application/x.bittorrent" = "torrent.desktop";
    "x-scheme-handler/magnet" = "torrent.desktop";
    "text/plain" = "nvim.desktop";

    "inode/directory" = "lf.desktop";


  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
