{
  wayland.windowManager.hyprland.extraConfig = 
  ''
  ################
  ### KEYBINDS ### 
  ################

  bind = $mainMod, Q, exec, $terminal
  bind = $mainMod, C, killactive,
  bind = $mainMod, M, exit,
  bind = $mainMod, E, exec, $fileManager
  bind = $mainMod, V, togglefloating,
  bind = ALT, SPACE, exec, $menu
  bind = $mainMod, P, pseudo, # dwindle
  bind = $mainMod, G, togglesplit, # dwindle
  bind = $mainMod, F, fullscreen,
  bind = $mainMod, D, fullscreen, 1

  # Move focus with mainMod + arrow keys
  bind = $mainMod, H, movefocus, l
  bind = $mainMod, L, movefocus, r
  bind = $mainMod, K, movefocus, u
  bind = $mainMod, J, movefocus, d

  # Switch workspaces with mainMod + [0-9]
  bind = $mainMod, 1, workspace, 1
  bind = $mainMod, 2, workspace, 2
  bind = $mainMod, 3, workspace, 3
  bind = $mainMod, 4, workspace, 4
  bind = $mainMod, 5, workspace, 5
  bind = $mainMod, 6, workspace, 6
  bind = $mainMod, 7, workspace, 7
  bind = $mainMod, 8, workspace, 8
  bind = $mainMod, 9, workspace, 9
  bind = $mainMod, 0, workspace, 10

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
  bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
  bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
  bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
  bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
  bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
  bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
  bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
  bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
  bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

  # Example special workspace (scratchpad)
  bind = $mainMod, S, togglespecialworkspace, magic
  bind = $mainMod SHIFT, S, movetoworkspace, special:magic

  # Scroll through existing workspaces with mainMod + scroll
  bind = $mainMod, mouse_down, workspace, e+1
  bind = $mainMod, mouse_up, workspace, e-1

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $mainMod, mouse:272, movewindow
  bindm = $mainMod, mouse:273, resizewindow

  # Grouping windows as tabs
  bind = $mainMod, T, togglegroup
  bind = $mainMod, Tab,changegroupactive,f

  # Reload waybar
  bind = $mainMod CONTROL, R, exec, pgrep waybar && pkill waybar || waybar &

  # Powermenu
  bind = $mainMod, L, exec, wlogout
 '';
}
