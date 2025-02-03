{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./autocommands.nix
    ./completion.nix
    ./keymappings.nix
    ./options.nix
  ];

   home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.useGlobalPackages = true;

  
    viAlias = true;
    vimAlias = true;


  };
}