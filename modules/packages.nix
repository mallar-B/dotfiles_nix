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
    vim
    wget
    zig
    zsh
    cargo
    python311Packages.pip
    python3
    networkmanagerapplet
    nodejs_22
    where-is-my-sddm-theme
    sddm
  ];

  ## user packages
  users.users.${user}.packages = with pkgs; [
    brave
    firefox
    # inputs.zen-browser.packages."${system}".default
    kitty
    localsend
    feh
    mpv
    nemo
    pavucontrol
    zoxide
    cloudflare-warp
    tmux
    mate.mate-polkit
  ];
fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka"]; })
  icomoon-feather
];
}
