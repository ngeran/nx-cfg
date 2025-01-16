{
	description = "Nixos Flake";


	inputs = {
	       nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
          hyprland.url = "github:hyprwm/Hyprland";
          stylix.url = "github:danth/stylix";
          nix-colors.url = "github:misterio77/nix-colors";
          #hardware.url = "github:nix-systems/nixos-hardware";
         #===[HYPRLAND]===
          hyprland-plugins = {
	         url = "github:hyprwm/hyprland-plugins";
	         inputs.hyprland.follows = "hyprland";
           };
           #===[HOME MANAGER]===        
          home-manager = {
             url = "github:nix-community/home-manager";
             inputs.nixpkgs.follows = "nixpkgs";
             };
	};


	outputs = { self, nixpkgs, home-manager, ...}@inputs:
		let
       inherit (self) outputs;
       lib = nixpkgs.lib // home-manager.lib;
       system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        user = "nikos"; 
		in
		{
         inherit lib; 
		   # ===[NixOs Configuratation]===
		   nixosConfigurations = {
         # ELITEDESK ===[Mini Workstation]===
         elitedesk = lib.nixosSystem {
                     specialArgs = {inherit inputs outputs system;};
                     modules = [./hosts/elitedesk/configuration.nix];
		              };

         # DESKTOP ===[Main Workstation]===
         desktop = lib.nixosSystem {
                     specialArgs = {inherit inputs outputs system;};
                     modules = [./hosts/desktop/configuration.nix];
		              };

         # VMWARE===[VMWARE INSTALLATION]===
         vmware = lib.nixosSystem {
                     specialArgs = {inherit inputs outputs system;};
                     modules = [./hosts/vmware/configuration.nix];
                     };

      };
                  
         # ===[Home Manager Configuration]===
         homeConfigurations = {
         # ELITEDESK ===[Mini Workstation]===         
         "nikos@elitedesk" = lib.homeManagerConfiguration {
                     pkgs = nixpkgs.legacyPackages.${system};
                     extraSpecialArgs = {inherit inputs;};
                     modules = [./home-manager/elitedesk.nix];
                  };

         # DESKTOP ===[Main Workstation]===         
         "nikos@desktop" =  lib.homeManagerConfiguration {
                     pkgs = nixpkgs.legacyPackages.${system};
                     extraSpecialArgs = {inherit inputs;};
                     modules = [./home-manager/desktop.nix];
                  };

          #VMWARE ===[VMWARE Workstation]===
         "nikos@vmware" = lib.homeManagerConfiguration {          
	                  pkgs = nixpkgs.legacyPackages.${system};
                     extraSpecialArgs = { inherit inputs outputs;};
                     modules = [ ./home-manager/vmware.nix ];
                   };

         };
		};

}
