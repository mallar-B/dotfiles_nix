{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    codeium-nvim.enable = true;
    codeium-nvim.settings = {
      enable_chat = true;
      tools = {
        curl = lib.getExe pkgs.curl;
        gzip = lib.getExe pkgs.gzip;
        uname = lib.getExe' pkgs.coreutils "uname";
        uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
      };
    };
  };
}
