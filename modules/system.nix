{pkgs, ...}: {
  # grub
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    gfxmodeEfi = "1920x1080";
  };
  boot.kernelParams = ["video=1920x1080" "loglevel=5"];
  boot.supportedFilesystems = ["ntfs"];

  systemd.tpm2.enable = false;

  # polkit_gnome
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # networks
  networking.hostName = "nix";
  networking.networkmanager.enable = true;

  # timezone and locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # gui
  services.xserver.enable = true;
  services.xserver.resolutions = [
    {
      x = 1920;
      y = 1080;
    }
  ];
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;

  # sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # firewall and ssh
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.openssh.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [3000 3001 3002 5173 53317];
  networking.firewall.allowedUDPPorts = [3000 3001 3002 5173 53317];
}
