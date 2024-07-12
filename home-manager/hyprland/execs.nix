{
  wayland.windowManager.hyprland.extraConfig = 
  ''
  ##########################
  ### EXECUTE ON STARTUP ###
  ##########################
  
  exec-once = swww-daemon
  exec-once = waybar
  exec-once = kdeconnect-indicator
  exec-once = warp-svc&
  exec-once = warp-taskbar
  '';
}
