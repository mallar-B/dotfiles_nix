{
  description = "Mallar's default flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: let
    userSettings = {
      user = "mallar";
    };
  in {
    packages."x86_64-linux".nvim= (nvf.lib.neovimConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [./modules/nvim/nvf.nix];}).neovim;

    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit userSettings;
      };
      modules = [
      	nvf.nixosModules.default
        # nvf.homeManagerModules.default
        ./modules/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
