{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
  ];

  programs.nixvim = {
    enable = true;
   

  };
}