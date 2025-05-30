{
  pkgs,
  userSettings,
  ...
}: let
  user = userSettings.user;
in {
  ## system packages
  environment.systemPackages = with pkgs; [
    btop
    cargo
    distrobox
    fastfetch
    fd
    fzf
    gh
    git
    gnome.gvfs
    gvfs
    kdePackages.sddm
    lazygit
    lua
    neovim # Different from nvf in flakes
    networkmanagerapplet
    nodejs_22
    ntfs3g
    python3
    python311Packages.pip
    ripgrep
    tailwindcss-language-server
    udiskie
    udisks
    udisks2
    unzip
    vim
    wget
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
    # mate.mate-polkit
    polkit_gnome
    mpv
    nemo
    pavucontrol
    swaynotificationcenter
    swayosd
    tmux
    vivaldi
    zoxide
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka"]; })
    icomoon-feather
    font-awesome
    lohit-fonts.bengali
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    noto-fonts-extra
  ];
}
