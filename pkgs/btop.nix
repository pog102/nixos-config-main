{ config, pkgs, ... }:

{

  programs.btop = {
    enable = true;

    settings = {

      color_theme = "nix";

      #* If the theme set background should be shown, set to False if you want terminal background transparency.
      theme_background = true;


    };
  };

  home.file.".config/btop/themes/nix.theme".text =
    ''

theme[main_bg]=""

# Main text color
theme[main_fg]="#${config.colorScheme.colors.base07}"

# Title color for boxes
theme[title]="#${config.colorScheme.colors.base07}"

# Higlight color for keyboard shortcuts
theme[hi_fg]="#${config.colorScheme.colors.base0C}"

# Background color of selected item in processes box
theme[selected_bg]="#${config.colorScheme.colors.base03}"

# Foreground color of selected item in processes box
theme[selected_fg]="#${config.colorScheme.colors.base07}"

# Color of inactive/disabled text
theme[inactive_fg]="#${config.colorScheme.colors.base04}"

# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
theme[proc_misc]="#${config.colorScheme.colors.base0C}"

# Cpu box outline color
theme[cpu_box]="#${config.colorScheme.colors.base04}"

# Memory/disks box outline color
theme[mem_box]="#${config.colorScheme.colors.base04}"

# Net up/down box outline color
theme[net_box]="#${config.colorScheme.colors.base04}"

# Processes box outline color
theme[proc_box]="#${config.colorScheme.colors.base04}"

# Box divider line and small boxes line color
theme[div_line]="#${config.colorScheme.colors.base04}"

# Temperature graph colors
theme[temp_start]="#${config.colorScheme.colors.base0B}"
theme[temp_mid]="#e0af68"
theme[temp_end]="#${config.colorScheme.colors.base0F}"

# CPU graph colors
theme[cpu_start]="#${config.colorScheme.colors.base0B}"
theme[cpu_mid]="#e0af68"
theme[cpu_end]="#${config.colorScheme.colors.base0F}"

# Mem/Disk free meter
theme[free_start]="#${config.colorScheme.colors.base0B}"
theme[free_mid]="#e0af68"
theme[free_end]="#${config.colorScheme.colors.base0F}"

# Mem/Disk cached meter
theme[cached_start]="#${config.colorScheme.colors.base0B}"
theme[cached_mid]="#e0af68"
theme[cached_end]="#${config.colorScheme.colors.base0F}"

# Mem/Disk available meter
theme[available_start]="#${config.colorScheme.colors.base0B}"
theme[available_mid]="#e0af68"
theme[available_end]="#${config.colorScheme.colors.base0F}"

# Mem/Disk used meter
theme[used_start]="#${config.colorScheme.colors.base0B}"
theme[used_mid]="#e0af68"
theme[used_end]="#${config.colorScheme.colors.base0F}"

# Download graph colors
theme[download_start]="#${config.colorScheme.colors.base0B}"
theme[download_mid]="#e0af68"
theme[download_end]="#${config.colorScheme.colors.base0F}"

# Upload graph colors
theme[upload_start]="#${config.colorScheme.colors.base0B}"
theme[upload_mid]="#e0af68"
theme[upload_end]="#${config.colorScheme.colors.base0F}"

		'';
}
