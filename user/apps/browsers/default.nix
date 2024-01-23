{pkgs, userSettings, ...}:
{
  xdg.mimeApps.defaultApplications = {
    "text/html" = userSettings.browser.default+".desktop";
    "x-scheme-handler/http" = userSettings.browser.default+".desktop";
    "x-scheme-handler/https" = userSettings.browser.default+".desktop";
    "x-scheme-handler/about" = userSettings.browser.default+".desktop";
    "x-scheme-handler/unknown" = userSettings.browser.default+".desktop";
  };

}