{
  pkgs,
  userSettings,
  ...
}: let
  user = userSettings.user;
in {
  imports = [
    (
      if builtins.pathExists ./modules/hardware-configuration.nix
      then ./modules/hardware-configuration.nix
      else "/etc/nixos/hardware-configuration.nix"
    )
    ./packages.nix
    ./user.nix
    ./system.nix
    ./services.nix
    ./android-dev.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  home-manager = {
    users = {
      ${user} = import ./home-manager/home.nix {inherit pkgs userSettings;};
    };
    backupFileExtension = "backup";
  };

  # # sddm
  # environment.systemPackages = with pkgs; [
  #   where-is-my-sddm-theme
  #   libsForQt5.qt5.qtgraphicaleffects
  #   libsForQt5.qtgraphicaleffects
  #   kdePackages.qt5compat
  # ];

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    android_sdk.accept_license = true;
  };
  home-manager.useGlobalPkgs = true;

  system.stateVersion = "24.05";
}
