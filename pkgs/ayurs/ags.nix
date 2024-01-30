{ config, inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
        # configDir = ../ags;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [ libsoup_3
    ];
  };
 home.file.".config/ags/style.css".text = ''

window#notifications {
    all: unset;
}

window#notifications box.notifications {
    padding: .5em;
}

.icon {
    min-width: 68px;
    min-height: 68px;
    margin-right: 1em;
}

.icon image {
    font-size: 58px;
    /* to center the icon */
    margin: 5px;
    color: #${config.colorScheme.colors.base0E};

}

.icon box {
    min-width: 68px;
    min-height: 68px;
    border-radius: 7px;
}

.notification {
    min-width: 350px;
    border-radius: 11px;
    padding: 1em;
    margin: .5em;
    border: 1px solid @wm_borders_edge;
    background-color: #${config.colorScheme.colors.base00};
}

.notification.critical {
    border: 1px solid lightcoral;
}

.title {
    color: #${config.colorScheme.colors.base06};;
    font-size: 1.4em;
}

.body {
    color: #${config.colorScheme.colors.base08};
}

.actions .action-button {
    margin: 0 .4em;
    margin-top: .8em;
}

.actions .action-button:first-child {
    margin-left: 0;
}

.actions .action-button:last-child {
    margin-right: 0;
}
  '';

	home.file.".config/ags" = {
		recursive = true;
		source = ./ags;
	};
}
