
{
  services.hypridle.enable = true;
  services.hypridle.settings = {
    listener = [{
      timeout = 200;
      on-timeout = "swaylock"; 
      }{
      timeout = 300;
      on-timeout = "systemctl suspend";
    }];
  };
}

