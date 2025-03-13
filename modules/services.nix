{pkgs, ...}: {
  services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
  services.cloudflare-warp.enable = true;
  programs.nm-applet.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
