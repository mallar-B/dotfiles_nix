{pkgs, ...}: {
  plugins = {
    snacks = {
      enable = true;
      settings = {
        bigfile.enable = true;
        quickfile.enable = true;
        statuscolumn.enable = true;
        notifier.style = "fancy";
        notifier.timeont = 5000;
      };
    };
  };
  extraPackages = [
    pkgs.lazygit
  ];
}
