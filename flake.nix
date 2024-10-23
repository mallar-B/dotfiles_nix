{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      userSettings = {
        user = "mallarb";
      };
    in
{
	nixosConfigurations.default = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";
      		specialArgs = { inherit inputs; inherit userSettings;};
      		modules = [./modules/configuration.nix];
	};
  };
}
