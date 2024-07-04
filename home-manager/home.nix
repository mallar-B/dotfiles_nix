{ config, pkgs, ... }:

{
  imports = [ 
  ./foot.nix 
  ./hypridle.nix
  ./hyprland/hyprland.nix
  ./tofi.nix
  ./developement.nix
  ];

  home.username = "mallarb";
  home.homeDirectory = "/home/mallarb";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    ags ## bar and widgets
    dolphin
    grim
    slurp
    wl-clipboard
    btop
    fastfetch
    floorp
    brave
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    sshfs
    haruna
    gruvbox-dark-gtk
    gnome.gnome-tweaks
    gruvbox-dark-icons-gtk
    kde-gruvbox
    qt5ct
    qt6ct
    swww
    cloudflare-warp

 # It is sometimes useful to fine-tune packages, for example, by applying
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

  gtk.theme.name = "gruvbox-dark-gtk";
  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kde-gruvbox";
  };

  services.kdeconnect.enable = true;
  services.kdeconnect.indicator = true;
  services.gnome-keyring.enable = true;
  programs.swaylock.enable = true;
  programs.feh.enable = true;
  programs.tofi.enable = true;
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = pkgs.lib.importTOML ~/Github/dotfiles_nix/configs/starship.toml;

 # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mallarb/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
#  # Hyprland
#  wayland.windowManager.hyprland = {
#    enable = true;
#    systemd.enable = true; # start on boot
#    xwayland.enable = true;
#    extraConfig = "bind = $mod+p, exec foot";
#  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
}
