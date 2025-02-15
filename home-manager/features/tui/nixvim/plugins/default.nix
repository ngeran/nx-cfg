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
    ./startify.nix
    ./neo-tree.nix
    ./telescope.nix
    ./neorg.nix
    ./noice.nix
    ./treesitter.nix
  ];


  #colorschemes.dracula.enable = true;
  #plugins.web-devicons.enable = true;

  programs.nixvim = {

   
  };
}
