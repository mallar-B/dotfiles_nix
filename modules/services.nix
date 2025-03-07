{ ... }:
{
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  services.cloudflare-warp.enable = true;
  programs.nm-applet.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.udiskie.enable = true;
  services.udiskie.tray= "auto";
}
