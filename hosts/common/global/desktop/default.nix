{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    #kitty
    alacritty
    #fish
    wget
    unzip
    firefox
    rofi-wayland
    wofi                                                                                                                                                                                                                                                                                                                                 
    openssh
    hugo                                                                                                                                                                              
    neofetch                                                                                                                                                                          
    btop 
    xfce.xfconf                                                                                                                                                                          
    xfce.thunar                                                                                                                                                                       
    xfce.thunar-volman 
    wl-clipboard 
    grim
    slurp
    swappy                                                                                                                                                    
    ags                                                                                                                                                                               
    wireguard-tools 
    pulseaudio
    pavucontrol                                                                                                                                                                             
    powertop 
    udiskie
    gvfs 
    ntfs3g
    neovim
    #Telescope
    vimPlugins.telescope-nvim 
    vimPlugins.telescope-fzf-native-nvim
    
  ];                            
}