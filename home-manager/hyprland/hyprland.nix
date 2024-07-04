{
  wayland.windowManager.hyprland.enable = true;
  imports = [
    ./decorations.nix
    ./execs.nix
    ./keybinds.nix
    ./layouts.nix
    ./monitors.nix
    ./rules.nix
    ./variables.nix
  ];
}
