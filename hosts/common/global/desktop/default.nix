{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    alacritty
    wget
    unzip
    firefox
    rofi-wayland
    wofi                                                                                                                                                                                                                                                                                                                                 
    openssh                                                                                                                                                                           
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
    
  ];                            
}