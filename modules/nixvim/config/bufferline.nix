{pkgs,self, ...}: {
  plugins = {
    telescope.enable = true;
    gitsigns.enable = true;
    which-key.enable = true;
    lazydev.enable = true;
    treesitter.enable = true;
    nvim-autopairs.enable = true;
    dap.enable = true;
    indent-blankline.enable = true;
    lint.enable = true;
    lualine.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings.sources = [
	{ name = "nvim_lsp"; }
	{ name = "path"; }
	{ name = "buffer"; }
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    conform-nvim.enable = true;
    lsp = {
      enable = true;
      servers = {
	ts_ls.enable = true;
	tailwindcss.enable = true;
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = gruvbox-material;
      config = ''
	lua vim.cmd.colorscheme('gruvbox-material')
	lua vim.cmd.colorscheme('gruvbox-material') 
      '';
    }
  ];
}
