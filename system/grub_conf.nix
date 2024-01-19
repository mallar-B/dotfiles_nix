{ config , ... }:
{

  boot.loader.grub = {
    efiSupport = true;
    device = "nodev";
    gfxmodeEfi = "1920x1080";
    useOSProber = true;
  };

}
