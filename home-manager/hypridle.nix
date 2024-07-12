
{
  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = [{
      before_sleep_cmd = "pgrep swaylock || swaylock";
      }];
    listener = [{
      timeout = 200;
      on-timeout = "swaylock"; 
      }{
      timeout = 300;
      on-timeout = "systemctl suspend";
    }];
  };
}

