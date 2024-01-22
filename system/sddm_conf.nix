{ pkgs, config, lib, ... }:
{
  services.xserver = {
   enable = true;
   exportConfiguration = true;
   resolutions = [
	{
	   x = 1920;
	   y = 1080;
	}
   ];
    displayManager.sddm = {
      enable = true;

      setupScript = '' 
        xrandr -s 1920x1080;
    #		wlr-randr --output HDMI-A-1 --mode 1920x1080;
			'';

    };
  };

}
