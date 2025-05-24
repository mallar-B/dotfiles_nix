{ pkgs, userSettings, ... }:
let
  user = userSettings.user;
in
{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "storage" "podman" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

}
