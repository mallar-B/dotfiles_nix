{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    foot
    gh
    git
    sddm
    tree
    wlr-randr
    xorg.xrandr  
    gnome.gnome-keyring
    libsecret
    polkit  

  ];
}
