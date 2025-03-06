{pkgs, ...}: {
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
