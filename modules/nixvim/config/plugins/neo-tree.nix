{
plugins = {
  web-devicons.enable = true;
  neo-tree = {
    enable = true;
    extraOptions = {
      window = {
        position = "right";
      };
    };
  };
};
keymaps = [{
  key = "\\";
  action = ":Neotree toggle<CR>";
}];
}
