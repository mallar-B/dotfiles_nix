{ config, lib, pkgs, inputs, userSettings, ... }:
  let
    user = userSettings.user;
  in 
{
  imports =
    [ 
  (if builtins.pathExists ./modules/hardware-configuration.nix then ./modules/hardware-configuration.nix else "/etc/nixos/hardware-configuration.nix")
      ./packages.nix
      ./user.nix
      ./system.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  home-manager = {
      users = {
        ${user}= import ./home-manager/home.nix;

        };
      backupFileExtension = "backup";
    };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  home-manager.useGlobalPkgs = true;

  system.stateVersion = "24.05"; 

}

