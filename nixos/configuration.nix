# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.checkJournalingFS= false;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  time.timeZone = "Europe/Zurich";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  # networking.interfaces.enp0s3.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.extraUsers.kris = {
    createHome = true;
    home = "/home/kris";
    description = "Kris Huber";
    isNormalUser = true;
    extraGroups = [ "wheel" "disk" "video" "audio" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # nix
    nix
    binutils

    # util
    zsh
    stow
    wget
    neofetch

    # term
    alacritty

    # dev tools
    neovim
    tmux
    gitAndTools.gitFull

    # dev languages
    gcc
    ghc
    rustup
    #haskellPackages.haskellPlatform
    
    # misc
    wgetpaste

    # net
    networkmanager
    brave

    # non free shitware
    discord

    # xmonad
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonad-contrib
    haskellPackages.xmonad-extras
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "SpaceMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  networking.networkmanager = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
        haskellPackages.xmobar
      ];
    };
    desktopManager.xterm.enable = false;
    displayManager.defaultSession = "none+xmonad";
    displayManager = {
      lightdm = {
        enable = true;
      };
    };
    wacom.enable = true;
  };


  system.stateVersion = "21.05";

}
