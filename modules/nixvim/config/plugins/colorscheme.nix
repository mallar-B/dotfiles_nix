{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    {
      # plugin = gruvbox-material;
      # config = ''
      #   lua vim.cmd.colorscheme('gruvbox-material')
      # '';

      plugin = catppuccin-nvim;
      config = ''
        lua vim.cmd.colorscheme('catppuccin-mocha')
      '';
   } 
  ];
}
