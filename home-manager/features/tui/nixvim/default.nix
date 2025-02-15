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

    # Additional recommended settings
    options = {
      termguicolors = true;  # Enable true color support
      background = "dark";   # Ensure background matches Gruvbox
    };

    # Enable Treesitter for better syntax highlighting
    plugins.treesitter.enable = true;

    # Configure LSP and other plugins (optional)
    plugins.lsp.servers.pylsp.enable = true;
  };
  
}