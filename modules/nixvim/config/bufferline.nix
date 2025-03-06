{pkgs, ...}: {
  plugins = {
    which-key.enable = true;
    lazydev.enable = true;
    treesitter.enable = true;
    nvim-autopairs.enable = true;
    dap.enable = true;
    indent-blankline.enable = true;
    lint.enable = true;
    lualine.enable = true;
    sleuth.enable = true;
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
