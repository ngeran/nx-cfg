{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.packages = with pkgs; [
    dejavu_fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
    nerd-fonts.hack
    nerd-fonts.fira-mono
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";


    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 1.0;
      popups = 1.0;
    };

    targets = {
      firefox.enable = true; 
      alacritty.enable = true;
      neovim.enable = false;
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 13;
        applications = 11;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
     
    # Set Local Background Image
    #image = ./Pictures/wallpapers/gruvbox-dark-blue.png;
    # Set Background Image from the Internet
     image = pkgs.fetchurl {
     url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/src/branch/master/png/gruvbox-dark-blue.png";
     sha256 = "+jfTuvl1VJocN+YNp04YVONR054GX+p/yxNXyyhsNcs=";

    };
  };
}

