{ pkgs, inputs, userSettings, ... }:
let
  user = userSettings.user;
in
{
  ## system packages
  environment.systemPackages = with pkgs;[
    btop
    fastfetch
    fzf
    gh
    git
    neovim
    ntfs3g
    wget
    zsh
  ];

  ## user packages
  users.users.${user}.packages = with pkgs; [
    foot
    kitty
    pavucontrol
    rofi-wayland
    brave
    cinnamon.nemo
    mpv
    qbittorrent
    inputs.zen-browser.packages."${system}".default
    localsend
    wl-clipboard
    zoxide
  ];
}
