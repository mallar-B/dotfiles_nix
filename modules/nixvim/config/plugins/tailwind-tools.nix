{pkgs, ...}: {
  plugins = {
    tailwind-tools.enable = true;
    tailwind-tools.settings = {
      cmp.highlight = "background";
      document_colors.enabled = true;
      server.override = true;
    };
  };
  extraPackages = [
    pkgs.tailwindcss-language-server
  ];
  extraConfigLua = ''
    require("lspconfig").tailwindcss.setup(
      {root_dir = require("lspconfig").util.root_pattern("package.json", ".git"),

      }
    )
  '';
}
