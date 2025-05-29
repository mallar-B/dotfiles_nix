{
  pkgs,
  userSettings,
  ...
}: let
  themeName = userSettings.theme;
  userName = userSettings.user;
in {
  home.username = userName;
  home.homeDirectory = "/home/${userName}";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    cloudflared
    discord
    foot
    github-desktop
    grim
    imagemagick
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    libreoffice
    obs-studio
    obsidian
    pgadmin4-desktopmode
    postgresql
    postman
    pulseaudioFull
    python312Packages.subliminal
    pywal16
    qbittorrent
    qutebrowser
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
    ".config/hypr".source = ../../configs/${themeName}/hypr;
    # ".config/nvim".source = ../../configd/${themeName}/nvim;
    ".config/foot".source = ../../configs/${themeName}/foot;
    ".config/kitty".source = ../../configs/${themeName}/kitty;
    ".config/mpv".source = ../../configs/${themeName}/mpv;
    ".config/nixpkgs".source = ../../configs/${themeName}/nixpkgs;
    ".config/waybar".source = ../../configs/${themeName}/waybar;
    ".config/rofi".source = ../../configs/${themeName}/rofi;
    ".config/wlogout".source = ../../configs/${themeName}/wlogout;
    ".config/tmux".source = ../../configs/${themeName}/tmux;
    ".config/swaync".source = ../../configs/${themeName}/swaync;
    ".config/qutebrowser".source = ../../configs/${themeName}/qutebrowser;
    ".config/swayosd".source = ../../configs/${themeName}/swayosd;
    ".local/bin".source = ../../scripts;
    ".zshrc".source = ../../configs/${themeName}/.zshrc;
  };

  # theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme =
      if themeName == "gruvbox"
      then {
        package = pkgs.gruvbox-material-gtk-theme;
        name = "Gruvbox-Material-Dark";
      }
      else if themeName == "catppuccin"
      then {
        package = pkgs.magnetic-catppuccin-gtk;
        name = "Catppuccin-GTK-Dark";
      }
      else {
        package = pkgs.gruvbox-material-gtk-theme;
        name = "Gruvbox-Material-Dark";
      };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name =
        if themeName == "gruvbox"
        then "Tela-black"
        else if themeName == "catppuccin"
        then "Tela-dracula"
        else "Tela-black";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
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

  services.udiskie.enable = true;
  services.udiskie.tray = "auto";

  programs.home-manager.enable = true;
}
