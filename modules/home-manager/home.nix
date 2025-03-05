{pkgs,inputs,config, ...}: {
  home.username = "mallar";
  home.homeDirectory = "/home/mallar";
  home.stateVersion = "24.05"; 

  home.packages = with pkgs; [
    discord
    foot
    github-desktop
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    oh-my-zsh
    pulseaudioFull
    python312Packages.subliminal
    qbittorrent
    rofi-wayland
    slurp
    swww
    telegram-desktop
    vimPlugins.LazyVim
    waybar
    wl-clipboard
    wlogout
    xdg-desktop-portal-hyprland
  ];

  home.file = {
    ".config/hypr".source = ../../configs/hypr;
    # ".config/nvim".source = ../../configd/nvim;
    ".config/foot".source = ../../configs/foot;
    ".config/kitty".source = ../../configs/kitty;
    ".config/mpv".source = ../../configs/mpv;
    ".config/nixpkgs".source = ../../configs/nixpkgs;
    ".config/waybar".source = ../../configs/waybar;
    ".config/rofi".source = ../../configs/rofi;
    ".config/wlogout".source = ../../configs/wlogout;
    ".config/tmux".source = ../../configs/tmux;
    ".local/bin".source = ../../scripts;
    ".zshrc".source = ../../configs/.zshrc;
  };

  # theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-material-gtk-theme;
      name = "Gruvbox-Material-Dark";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
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
      cp = "cp -r";
      cd = "z";
    };
    # history = {
    #   size = 10000;
    #   path = "${config.xdg.dataHome}/zsh/history";
    # };
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "colored-man-pages" "sudo" "zoxide"];
    #   theme = "gnzh";
    # };
  };

  programs.home-manager.enable = true;
}
