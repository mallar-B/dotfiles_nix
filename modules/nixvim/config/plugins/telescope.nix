{
  plugins = {
    telescope = {
      enable = true;
      autoLoad = true; 
      extensions.ui-select.enable = true;
    };
  };
  keymaps = [
  {
    mode = "n";
    key = "<leader>sh";
    action = "<cmd>Telescope help_tags<CR>";
    options.desc = "[S]earch [H]elp";
  }
  {
    mode = "n";
    key = "<leader>sk";
    action = "<cmd>Telescope keymaps<CR>";
    options.desc = "[S]earch [K]eymaps";
  }
  {
    mode = "n";
    key = "<leader>sf";
    action = "<cmd>Telescope find_files<CR>";
    options.desc = "[S]earch [F]iles";
  }
  {
    mode = "n";
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<CR>";
    options.desc = "[F]ind [F]iles";
  }
  {
    mode = "n";
    key = "<leader>ss";
    action = "<cmd>Telescope builtin<CR>";
    options.desc = "[S]earch [S]elect Telescope";
  }
  {
    mode = "n";
    key = "<leader>sd";
    action = ":Telescope diagnostic<CR>";
    options.desc = "[S]earch [D]iagnostics";
  }
  {
    mode = "n";
    key = "<leader>sw";
    action = "<cmd>Telescope grep_string<CR>";
    options.desc = "[S]earch current [W]ord";
  }
  {
    mode = "n";
    key = "<leader>sg";
    action = "<cmd>Telescope live_grep<CR>";
    options.desc = "[S]earch by [G]rep";
  }
  {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "[] Find existing buffers";
  }
  ];

}
