{ config, pkgs, userSettings, ... }:

{

  imports = [
    ../../user/shell_conf.nix
    (./. + "../../../user/apps/office"+("/"+userSettings.office.word)+".nix")
    ../../user/apps/browsers/default.nix
    (./. + "../../../user/apps/browsers"+("/"+userSettings.browser.default)+".nix")
    (./. + "../../../user/apps/browsers"+("/"+userSettings.browser.secondary)+".nix")
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mallarb";
  home.homeDirectory = "/home/mallarb";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    btop
    # chromium
    dolphin
    dunst
    eww
    # floorp
    fuzzel
    github-desktop
    hyprland
    kdeconnect
    kitty
    libnotify
    mpv
    pavucontrol
    qt5ct
    smplayer
    swayidle
    swaylock
    swww
    vscodium
    waybar
    wget
    wofi
    neofetch    

    libsForQt5.kio-extras
    libsForQt5.breeze-icons
    breeze-icons

    feh # simple image viewer
    grim
    slurp
    wl-clipboard

    font-awesome_5
    mpd
    pywal
    sassc

    # cloudflare-warp

    
    
    # gnomeExtensions.gsconnect

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mallarb/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   # EDITOR = "emacs";
  # };


  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 22;
};
 

  # github cli
  programs.gh.enable = true;

  programs.mpv.enable = true;
  
  gtk.enable = true;
  qt.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.mpd.enable = true;
  services.mpd.network.listenAddress = "any";
  services.mpd.musicDirectory = "/home/mallarb/Music";
}
  
