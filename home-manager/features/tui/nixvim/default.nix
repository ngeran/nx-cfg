{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
    ./autocommands.nix
    ./keymappings.nix
  ];

  programs.nixvim = {
    enable = true;
   

  };
}