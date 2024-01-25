  { config, pkgs, inputs, ... }:
  {
  programs.firefox = {
    enable = true;
    profiles.chad = {

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
      search.force = true;

      bookmarks = [
        {
          name = "wikipedia";
          tags = [ "wiki" ];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
      ];

      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      userChrome = ''                         
	/* Source file made available under Mozilla Public License v. 2.0 See the main repository for updates as well as full license text. 
   https://github.com/Godiesc/firefox-gx */

/* ############# Required files ############## */

@import url('components/ogx_root.css');
@import url('components/ogx_root-personal.css');
@import url('components/ogx_containers.css');
@import url('components/ogx_tabs-bar.css');
@import url('components/ogx_urlbar-searchbar.css');
@import url('components/ogx_windows-controls.css');
@import url('components/ogx_customize-styles.css');
@import url('components/ogx_sound.css');
@import url('components/ogx_arrowpanel.css');
@import url('components/ogx_contextual-menu.css');
@import url('components/ogx_notifications.css');
@import url('components/ogx_close-button.css');
@import url('components/ogx_button-styles.css');
@import url('components/ogx_library.css');
@import url('components/ogx_menu.css');
@import url('components/ogx_icons.css');

/* ############## Extra Files ###############  */

@import url('components/ogx_left-sidebar.css');
@import url('components/ogx_oneline.css');
@import url('components/ogx_tab-shapes.css');
@import url('components/ogx_tree-tabs.css');
@import url('components/ogx_autohide_bookmark-bar.css');
@import url('components/ogx_main-image.css');

/* ############# Your Personal File ##############  */

@import url('components/ogx_tricks.css');

      '';                                      
userContent = ''
/* Source file made available under Mozilla Public License v. 2.0 See the main repository for updates as well as full license text. 
   https://github.com/Godiesc/opera-gx */  

@import url(components/ogx_root-personal.css);
@import url(components/ogx_UC-newtabpage.css);
@import url(components/ogx_UC-settings-addons-pages.css);
@import url(components/ogx_UC-addons-store.css);

                '';
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
      ublock-origin
      darkreader
      ];

    };
  };
  }
