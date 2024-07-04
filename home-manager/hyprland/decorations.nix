{
  wayland.windowManager.hyprland.extraConfig = 
  ''
  ###################
  ### DECORATIONS ###
  ###################

  decoration {
      rounding = 3

      active_opacity = 0.92
      inactive_opacity = 0.88
      dim_inactive = true
      dim_strength = 0.2

      drop_shadow = false
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)

      blur {
          new_optimizations = true
          enabled = true
          size = 3
          passes = 2
          
          vibrancy = 0.1696
      }
  }

  animations {
      enabled = true

      first_launch_animation = true
      bezier = windowin,0.15,1.15,0.95,1
      bezier = windowmove,0.4, 1, 0.05,1.05
      bezier = workspace,0.2, 1.18, 0.35,1

      animation = windows, 1, 5, default, popin 80%
      animation = windowsOut, 1, 5, default, slide 
      animation = windowsMove, 1, 5, windowmove, popin
      animation = workspaces, 1, 5, workspace, slidefade 20%
      animation = specialWorkspace, 1, 5, workspace, slidevert
  }

  misc { 
      force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
  }
  '';
}
