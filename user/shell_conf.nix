{ pkgs, ... }:

    let
     myAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "nshell" = "nix-shell -p";
    };
    in
    {
      programs.bash = {
  	    enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
      };
    }
