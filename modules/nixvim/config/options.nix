{
  globals = {
    maplocalleader = " ";
    mapleader = " ";
    have_nerd_font = true;
  };
  opts = {
    number = true;
    mouse = "a";
    showmode = false;
    breakindent = true;
    undofile = true; # save undo history
    ignorecase = true;
    smartcase = true;
    signcolumn = "yes"; # gutter
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    inccommand = "split"; # show substitutions live
    cursorline = true;
    scrolloff = 12; # min number of line to keep above/below  cursor
  };
  autoCmd = [
    {
      event = "TextYankPost";
      callback = {__raw="function() vim.highlight.on_yank() end";};
    }
  ];
  keymaps = [
  # remove highlight after searching
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>"; 
    }

  # moving through windows
    {
      mode = "n";
      key = "<leader>q";
      action = '':lua vim.diagnostic.setloclist()<CR>''; 
      options.desc = "Open diagnostic [Q]uickfix list";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = '':lua vim.diagnostic.open_float()''; 
      options.desc = "Show [E]rror message under cursor";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>"; 
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>"; 
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>"; 
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>"; 
    }

  # copy to clipboard
    {
      mode = "x";  # All visual modes
      key = "<C-c>";
      action = "\"+y"; 
      options.desc = "Copy to system clipboard";
    }
  ];
  
}
