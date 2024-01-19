{ pkgs, ... }:

    let
     myAliases = {
      ll = "ls -al";
      ".." = "cd .."; 
    };
    in
    {
      programs.bash = {
  	enable = true;
	enableCompletion = true;
	shellAliases = myAliases;
      };
    }
