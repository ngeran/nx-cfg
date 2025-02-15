{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
    ./autocommands.nix
  ];

  programs.nixvim = {
    enable = true;
   

  };
}