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
    zig
    zsh
    cargo
  ];

  ## user packages
  users.users.${user}.packages = with pkgs; [
    brave
    foot
    inputs.zen-browser.packages."${system}".default
    kitty
    localsend
    mpv
    nemo
    pavucontrol
    qbittorrent
    rofi-wayland
    wl-clipboard
    zoxide
  ];
}
