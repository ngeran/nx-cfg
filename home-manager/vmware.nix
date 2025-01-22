{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nikos";
  home.homeDirectory = "/home/nikos";
  
  imports = [
       ./features/cli/vm-default.nix
       ./features/desktop/hyprland
       ./features/desktop/waybar
        inputs.nix-colors.homeManagerModules.default
        ];

  # Color Scheme
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home.stateVersion = "24.11";
  
  # Packages 
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
