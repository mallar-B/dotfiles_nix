{

  description = "first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";  
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      systemSettings = {
        profile = "main";
      };

      userSettings = {
        office = {
          word = "abiword";
        };
        browser = {
          default = "floorp";
          secondary = "ungoogled-chromium";
        };
      };

      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in{
    nixosConfigurations = {
      MAIN = lib.nixosSystem {
        inherit system;
	modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/configuration.nix") ];
      };
    };
    homeConfigurations = {
      mallarb = home-manager.lib.homeManagerConfiguration{
        inherit pkgs;  
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };  


	modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/home.nix") ];	
      };
    };
  };

}
