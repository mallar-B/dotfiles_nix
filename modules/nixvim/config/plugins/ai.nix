{
  # plugins = {
  #   codeium-nvim.enable = true;
  #   codeium-nvim.settings = {
  #     enable_chat = true;
  #     tools = {
  #       curl = lib.getExe pkgs.curl;
  #       gzip = lib.getExe pkgs.gzip;
  #       uname = lib.getExe' pkgs.coreutils "uname";
  #       uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
  #     };
  #   };
  # };
  plugins.codecompanion.enable = true;
  plugins.codecompanion.settings = {
    adapters = {
      gemini = {
        __raw = ''
          function()
            return require('codecompanion.adapters').extend('gemini', {
              env = {
                  api_key = os.getenv("GEMINI_API_KEY"),
              },
            })
          end
        '';
      };
    };

    strategies = {
      agent = {
        adapter = "gemini";
      };
      chat = {
        adapter = "gemini";
      };
      inline = {
        adapter = "gemini";
      };
    };
  };
}
