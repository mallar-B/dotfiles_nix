{ ... }:
{
  # grub
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    gfxmodeEfi = "1920x1080";
  };
  boot.kernelParams = [ "video=1920x1080" "loglevel=5" ];
  systemd.tpm2.enable = false;

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
  services.xserver.resolutions = [{x = 1920; y = 1080;}];
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
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

}
