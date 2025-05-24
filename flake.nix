{
  description = "Mallar's default flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    userSettings = {
      user = "mallar";
      theme = "catppuccin"; # gruvbox, catppuccin
    };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit userSettings;
      };
      modules = [
        ./modules/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
