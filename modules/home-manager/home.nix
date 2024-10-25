{ config, pkgs, inputs, ... }:

{
  home.username = "mallarb";
  home.homeDirectory = "/home/mallarb";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    waybar
    hypridle
    rofi-wayland
    wl-clipboard
    foot
    hyprlock
    hyprpaper
    grim
    slurp
    libnotify
    hyprpicker
    oh-my-zsh
    trashy
    telegram-desktop
    discord
    xdg-desktop-portal-hyprland
    github-desktop
    python312Packages.subliminal
    qbittorrent
    vimPlugins.LazyVim
    pulseaudioFull
    wlogout
    swww
  ];

  home.file = {
    ".config/hypr".source = ../../configs/hypr;
    ".config/nvim".source = ../../configs/nvim;
    ".config/foot".source = ../../configs/foot;
    ".config/kitty".source = ../../configs/kitty;
    ".config/mpv".source = ../../configs/mpv;
    ".config/nixpkgs".source = ../../configs/nixpkgs;
    ".config/waybar".source = ../../configs/waybar;
    ".config/rofi".source = ../../configs/rofi;
    ".config/wlogout".source = ../../configs/wlogout;
    ".local/scripts".source = ../../scripts;
  };

  # theme
  gtk = { 
    enable = true;
    theme = {
      package = pkgs.graphite-gtk-theme;
      name = "Graphite-Dark";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors-translucent;
      name = "Bibata_Ghost";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
  };
  qt.enable = true;
  qt.platformTheme.name = "gtk";

  # shell
  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
    rm = "trash";
    cp = "cp -r";
    cd = "z";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "colored-man-pages" "sudo" "zoxide"];
    theme = "gnzh";
  };

};

  programs.home-manager.enable = true;
}
