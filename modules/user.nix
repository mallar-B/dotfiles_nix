{ pkgs, userSettings, ... }:
let
  user = userSettings.user;
in
{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

}
