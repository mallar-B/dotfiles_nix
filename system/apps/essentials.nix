{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    foot
    gh
    git
    gnome.gnome-keyring #necessary for gui authentications like gh-desktop
    sddm
    tree
    wlr-randr
    xorg.xrandr  
    libsecret
    polkit  

  ];
}
