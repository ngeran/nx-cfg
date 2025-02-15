{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
   
    colorscheme = "gruvbox";

    # Enable Gruvbox plugin for better experience
    plugins.gruvbox = {
      enable = true;
      settings = {
        background = "dark"; # or "light"
        contrast = "soft";   # Options: "soft", "medium", "hard"
        transparent = false; # Set true for transparency
      };
    };

  };
}