{
  wayland.windowManager.hyprland.extraConfig = 
  ''
  $terminal = foot 
  $fileManager = dolphin
  $menu = tofi-drun --drun-launch=true
  $mainMod = "SUPER"  

  #############################
  ### ENVIRONMENT VARIABLES ###
  #############################

  env = XCURSOR_SIZE,24
  env = HYPRCURSOR_SIZE,24

  '';
}
