{
  wayland.windowManager.hyprland.extraConfig = 
  ''
  ###############
  ### LAYOUTS ###
  ###############

  general { 
    gaps_in = 1
    gaps_out = 1

    border_size = 2

    col.active_border = rgba(8ec07cee) 
    col.inactive_border = rgba(3c3836ee)

    resize_on_border = true

    allow_tearing = false

    layout = dwindle
}


dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
}
master {
    new_status = master
}
  '';
}
