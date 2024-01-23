{ pkgs, ... }:

    let
     myAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "nshell" = "nix-shell -p";
      "hsf" = "home-manager switch --flake .";
    };
    in
    {
      programs.bash = {
  	    enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
      };
    }
