# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports = [
       # Include NixOS Hαrdware
       inputs.nixos-hardware.nixosModules.common-gpu-intel
       inputs.nixos-hardware.nixosModules.common-cpu-intel
       inputs.nixos-hardware.nixosModules.common-pc-ssd

       # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/global/desktop
      ../common/optional/bluetooth.nix
      ../common/optional/pipewire.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "elitedesk";

   # Intel Graphcs
    hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # your Open GL, Vulkan and VAAPI drivers
      vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      #onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      #intel-media-sdk   # for older GPUs
    ];
   };

  # Hyprland Configuration
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account.
  users.users.nikos = {
    isNormalUser = true;
    description = "nikos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim
    # wget
    # git
  ];

  # Power Management
  powerManagement.powertop.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable zsh
  programs.zsh.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
  # Enable Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
