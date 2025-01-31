{ pkgs, ... }: {
  # This will allow packages that are not free to 
  # be installed
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Desktop apps
     inkscape-with-extensions
     krita
     kicad
     dropbox
     obsidian
   #  logseq 
    # zathura
    helix
     vlc
    # CLI utils
    tree
    kitty
    bash-completion 
    # Coding stuff
    nodejs
    cargo
    rustc
    gnumake
    hugo 
    code-cursor
    # WM stuff
   libsForQt5.xwaylandvideobridge
   xdg-desktop-portal-gtk
   xdg-desktop-portal-hyprland
   xdg-desktop-portal-wlr
    # Other
    bat
    tailwindcss
    #Automation 
    opentofu
  ];
}

