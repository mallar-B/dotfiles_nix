{ pkgs, userSettings, ... }:
let
  user = userSettings.user;
in
{
  ## system packages
  environment.systemPackages = with pkgs;[
    btop
    cargo
    fastfetch
    fd
    fzf
    gh
    git
    kdePackages.sddm
    lua
    neovim # Different from nvf in flakes
    networkmanagerapplet
    nodejs_22
    ntfs3g
    python3
    python311Packages.pip
    ripgrep
    unzip
    vim
    wget
    where-is-my-sddm-theme
    zig
    zsh
  ];

  ## user packages
  users.users.${user}.packages = with pkgs; [
    # inputs.zen-browser.packages."${system}".default
    brave
    cloudflare-warp
    feh
    firefox
    kitty
    localsend
    mate.mate-polkit
    mpv
    nemo
    pavucontrol
    tmux
    zoxide
  ];
fonts.packages = with pkgs; [
  #(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka"]; })
  icomoon-feather
  font-awesome
  nerd-fonts.droid-sans-mono
  nerd-fonts.fira-code
  nerd-fonts.iosevka
];
}
