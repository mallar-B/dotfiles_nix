{ pkgs, config, lib, ... }:
{
  services.xserver = {
   enable = true;
    displayManager = {
      sddm.enable = true;
     # sddm.enableHidpi = false;
    #  sddm.wayland.enable = true;
   #   sddm.setupScript = "wlr-randr --output HDMI-A-1 --custom-mode 1920x1080";
      sddm.setupScript = ''
		#	xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
		#	xrandr --addmode 1920x1080_60.00
			xrandr -s 1920x1080
			'';
    };
  };

#  services.xserver = {
 #   enable = true;
  #  displayManager.lightdm = {
   #   enable = true;
      
    #};
  #};


# services.xserver.displayManager.sddm.settings = ''
#   [X11]
#   ServerArguments=-nolisten tcp
# 
#   [Server]
#   session-wrapper=/etc/sddm/scripts/Xsession
#   display-setup-script=/etc/sddm/scripts/Xsetup
# 
#   [X11]
#   ServerVT=1
#   DisplayCommand=/usr/bin/X -s 0 -dpms
#   XftDpi=96
#   ServerArguments=-nolisten tcp -dpi 96
#   [Seat:*]
#   xserver-command=/run/current-system/sw/bin/Xorg
# 
#   [XDisplay]
#   ServerArguments=-nolisten tcp -dpi 96 -screen 0 1920x1080
# '';




}
