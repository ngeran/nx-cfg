{
	description = "Nixos Flake";


	inputs = {
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

		   # ===[NixOs Configuratation]===
		   nixosConfigurations = {
         # ELITEDESK ===[Mini Workstation]===
         elitedesk = nixpkgs.lib.nixosSystem {
                     specialArgs = {inherit inputs system;};
                     modules = [./hosts/elitedesk/configuration.nix];
		              };
         # DESKTOP ===[Main Workstation]===
         desktop = nixpkgs.lib.nixosSystem {
                     specialArgs = {inherit inputs system;};
                     modules = [./hosts/desktop/configuration.nix];
		              };
      };
                  
         # ===[Home Configuration]===
         homeConfigurations {
         # ELITEDESK ===[Mini Workstation]===         
         "nikos@elitedesk" = home-manager.lib.homeManagerConfiguration {
                     pkgs = nixpkgs.legacyPackages.${system};
                     extraSpecialArgs = {inherit inputs;};
                     modules = [./home-manager/elitedesk.nix];
                  };
         # DESKTOP ===[Main Workstation]===         
         "nikos@desktop" = home-manager.lib.homeManagerConfiguration {
                     pkgs = nixpkgs.legacyPackages.${system};
                     extraSpecialArgs = {inherit inputs;};
                     modules = [./home-manager/desktop.nix];
                  };

         };
		};

}
