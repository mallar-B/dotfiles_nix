{pkgs, ...}: let
  androidPkgs = pkgs.androidenv.composeAndroidPackages {
    toolsVersion = "26.1.1";
    platformToolsVersion = "34.0.5";
    buildToolsVersions = ["34.0.0"];
    includeEmulator = true;
    includeSystemImages = true;
    platformVersions = ["34"];
    abiVersions = ["google_apis;x86_64"]; # Emulator ABI
  };
in {
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    android-studio
    androidPkgs.androidsdk
    androidPkgs.platform-tools
    (builtins.elemAt androidPkgs.build-tools 0) # Select first build-tools package
    androidPkgs.emulator
    nodejs_20
    yarn
    watchman
    fastlane
    jdk17
    jdk21
    xorg.libX11
  ];
  users.users.mallar.extraGroups = ["adbusers"];

  environment.variables = {
    # will manually download sdk from android-studio
    ANDROID_HOME = "/home/mallar/Android/Sdk/";
    # ANDROID_HOME = "${androidPkgs.androidsdk}/libexec/android-sdk";
    # ANDROID_SDK_ROOT = "${androidPkgs.androidsdk}/libexec/android-sdk";
    # ANDROID_NDK_ROOT = "${androidPkgs.androidsdk}/libexec/android-sdk/ndk/25.2.9519653"; # Adjust if needed
    JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
    # PATH = ["${androidPkgs.androidsdk}/bin" "${androidPkgs.platform-tools}/bin"];
  };

  # Udev rules for Android devices
  services.udev.packages = [pkgs.android-udev-rules];

  nixpkgs.config.allowUnfree = true;
}
# {
#   pkgs,
#   ...
# }: {
#   # Enable necessary system packages
#   environment.systemPackages = with pkgs; [
#     (androidenv.androidSdk {
#       buildToolsVersions = [ "34.0.0" ]; # Specify required build tools
#       platformVersions = [ "34" ];       # Specify required Android versions
#       includeEmulator = true;            # Include Android emulator
#       includeSources = true;
#       includeSystemImages = true;
#     })
#     watchman
#     jdk17 # Java 17 (or change to your preferred version)
#     gradle # Required for Android builds
#     android-tools
#     adb-sync
#     android-studio
#   ];
#    environment.variables = {
#     ANDROID_HOME = "${pkgs.androidenv.composeAndroidPackages.androidsdk}/libexec/android-sdk";
#     ANDROID_SDK_ROOT = "${pkgs.androidenv.composeAndroidPackages.androidsdk}/libexec/android-sdk";
#     PATH = [ "${pkgs.androidenv.composeAndroidPackages.platform-tools}/bin" ];
#   };
#
#   # Setup udev rules for Android devices (USB debugging)
#   services.udev.packages = [pkgs.android-udev-rules];
#
#   # Optionally, increase file watch limit (helps with large projects)
#   boot.kernel.sysctl = {
#     "fs.inotify.max_user_watches" = 524288;
#   };
#
#   # Optional: Enable KVM for Android Emulator
#   virtualisation.kvmgt.enable = true;
# }

