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
  ];


  #colorschemes.dracula.enable = true;
  #plugins.web-devicons.enable = true;

  programs.nixvim = {

   
  };
}
