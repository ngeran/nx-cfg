{
  lib,
  config,
  ...
}:
{
  imports = [
    ./which-key.nix
    ./markdown-preview.nix
    ./toggleterm.nix
    ./lsp.nix
    ./lualine.nix
  ];


  #colorschemes.dracula.enable = true;
  #plugins.web-devicons.enable = true;

  programs.nixvim = {

   
  };
}
