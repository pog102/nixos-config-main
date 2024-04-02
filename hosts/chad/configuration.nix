# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ userSettings, config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixosModules
      # ./settings.nix
    ];
  nvidia.enable = true;
  transmission.enable = true;
  cpu.enable = true;
  steam.enable = true;
  jellyfin.enable = true;

  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.efi.efiSysMountPoint = "/boot";

  # swapDevices = [ {
  #     device = "/var/lib/swapfile";
  #     size = 5*1024;
  #   } ];

  # system.activationScripts.script.text = ''
  #     #!/bin/sh
  # if [ ! -d /home/chad/.cache/wal ]
  # then
  #     cp -r /home/chad/nixos-config-main/cache/* /home/chad/.cache
  #     fi
  #     
  # '';

  boot.tmp.cleanOnBoot = true;
  # boot.loader = {
  # grub2-theme={
  # theme="vimix";
  # icon="color";
  # };
  #   efi = {
  #     canTouchEfiVariables = true;
  #     efiSysMountPoint = "/boot"; # ← use the same mount point here.
  #   };
  #   grub = {
  #     efiSupport = true;
  #      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
  #      device = "nodev";
  #      # grub2-theme
  #      # minegrub-theme = {
  #      #   enable = true;
  #      # };
  #      # extraConfig = "set theme=${pkgs.nixos-grub2-theme}";
  # # theme=${pkgs.nixos-grub2-theme}/grub/themes/breeze/theme.txt";
  #   };
  # };









  #  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    #systemd-boot.configurationLimit = 3;
  };
  networking.hostName = "nixos"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vilnius";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  programs.zsh.enable = true;
  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver =
    {
      xkb.layout = "us";
      xkb.variant = "";
    };

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # programs.hyprland.enable = true;

  # home-manager."chad" = {
  #   extraSpecialArgs = {
  #     inherit inputs;
  #     inherit userSettings;
  #   };
  #   users = {
  #     modules = [
  #       ./home.nix
  #       inputs.self.outputs.homeManagerModules.default
  #     ];
  #   };
  # };
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit userSettings;
    };
    users = {
      "chad" = import ./home.nix;
    };
  };
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  # security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  hardware.brillo.enable = true;
  users.users.chad = {
    isNormalUser = true;
    description = "chad";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
      #      firefox
      #      kate
      #  thunderbird
    ];
  };


  services.getty.autologinUser = lib.mkDefault "chad";


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2d";
  };
  system.autoUpgrade.enable = true;



  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
