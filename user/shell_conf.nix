{ pkgs, ... }:

    let
     myAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "nshell" = "nix-shell -p";
      "hmsf" = "home-manager switch --flake";
      "nrfs" = "sudo nixos-rebuild switch --flake";
    };
    in
    {
      programs.bash = {
  	    enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
      };
    }
