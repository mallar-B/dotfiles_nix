{ config, pkgs, inputs, ... }:

{
  home.username = "mallarb";
  home.homeDirectory = "/home/mallarb";

  home.stateVersion = "24.05";

    home.packages = with pkgs; [
      gbar
      hypridle
      hyprlock
      hyprpaper
    ];

  home.file = {
    ".config/hypr".source = ../../configs/hypr;
    ".config/nvim".source = ../../configs/nvim;
    ".config/foot".source = ../../configs/foot;
    ".config/kitty".source = ../../configs/kitty;
    # ".config/mpv".source = ../../configs/mpv;
  };


  home.sessionVariables = {
    # EDITOR = "emacs";
    TERM = "foot";
  };
fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
