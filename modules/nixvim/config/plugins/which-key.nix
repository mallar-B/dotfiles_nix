{
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0; # Delay before showing which-key (in milliseconds)
      icons = {
        mappings = true; # Enable icon mappings
        keys = {
          Up = "<Up> ";
          Down = "<Down> ";
          Left = "<Left> ";
          Right = "<Right> ";
          C = "<C-…> ";
          M = "<M-…> ";
          D = "<D-…> ";
          S = "<S-…> ";
          CR = "<CR> ";
          Esc = "<Esc> ";
          ScrollWheelDown = "<ScrollWheelDown> ";
          ScrollWheelUp = "<ScrollWheelUp> ";
          NL = "<NL> ";
          BS = "<BS> ";
          Space = "<Space> ";
          Tab = "<Tab> ";
          F1 = "<F1>";
          F2 = "<F2>";
          F3 = "<F3>";
          F4 = "<F4>";
          F5 = "<F5>";
          F6 = "<F6>";
          F7 = "<F7>";
          F8 = "<F8>";
          F9 = "<F9>";
          F10 = "<F10>";
          F11 = "<F11>";
          F12 = "<F12>";
        };
      };
      spec = [
        { __unkeyed = "<leader>c"; group = "[C]ode"; mode = [ "n" "x" ]; }
        { __unkeyed = "<leader>d"; group = "[D]ocument"; }
        { __unkeyed = "<leader>r"; group = "[R]ename"; }
        { __unkeyed = "<leader>s"; group = "[S]earch"; }
        { __unkeyed = "<leader>w"; group = "[W]orkspace"; }
        { __unkeyed = "<leader>t"; group = "[T]oggle"; }
        { __unkeyed = "<leader>h"; group = "Git [H]unk"; mode = [ "n" "v" ]; }
      ];
    };
  };
  extraConfigLua = ''
    local wk = require("which-key")
    if vim.g.have_nerd_font then
      wk.setup {
        icons = { keys = {} } -- Use default Nerd Font icons
      }
    end
  '';
}

