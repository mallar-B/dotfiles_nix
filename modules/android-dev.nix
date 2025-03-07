{ config, pkgs, ... }:

{
  # Enable necessary system packages
  environment.systemPackages = with pkgs; [
    # (androidenv.androidSdk {
    #   buildToolsVersions = [ "34.0.0" ]; # Specify required build tools
    #   platformVersions = [ "34" ];       # Specify required Android versions
    #   includeEmulator = true;            # Include Android emulator
    #   includeSources = true;
    #   includeSystemImages = true;
    # })
    watchman
    jdk17          # Java 17 (or change to your preferred version)
    gradle         # Required for Android builds
    android-tools
    adb-sync
    android-studio
  ];

  # Setup udev rules for Android devices (USB debugging)
  services.udev.packages = [ pkgs.android-udev-rules ];

  # Optionally, increase file watch limit (helps with large projects)
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288;
  };

  # Optional: Enable KVM for Android Emulator
  virtualisation.kvmgt.enable = true;
}
