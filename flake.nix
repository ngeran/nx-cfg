{
  description = "Nikos Home Manager Configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors"; 

    hyprland-plugins = {
     url = "github:hyprwm/hyprland-plugins";
     inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    outputs = { self, nixpkgs, home-manager, ...}@inputs:
		let
		  system = "x86_64-linux";
     		  pkgs = nixpkgs.legacyPackages.${system};
		in
		{
		# NixOs ===[Configuration]===
		nixosConfigurations.elitedesk = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
                  ./hosts/elitedesk/configuration.nix
                   inputs.stylix.nixosModules.stylix
                ];
		   };
                  
    # ELITEDESK ===[Workstation]===
    homeConfigurations."nikos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {inherit inputs;};
      modules = [./home-manager/elitedesk.nix];
        };
		};


}
