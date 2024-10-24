{ config, lib, pkgs, inputs, userSettings, ... }:
  let
    user = userSettings.user;
  in 
{
  imports =
    [ 
      ./hardware-configuration.nix
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

  system.stateVersion = "24.05"; 

}

