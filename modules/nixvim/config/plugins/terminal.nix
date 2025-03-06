{
  plugins = {
    toggleterm.enable = true;
    toggleterm.settings ={
      direction = "horizontal";
      open_mapping = "[[<C-/>]]";
    };
  };
  keymaps = [
    {
      mode = ["n" "i" "t"];
      key = "<C-t>";
      action = "<cmd>ToggleTermToggleAll<CR>";
    }
    {
      mode = ["t"];
      key = "<Esc><Esc>";
      action =  "<C-\\><C-n>";
    }
  ];
}
