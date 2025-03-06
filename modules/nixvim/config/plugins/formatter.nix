{lib, pkgs, ... }: {
    plugins.treesitter.enable = true;
    plugins.conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        lua = [ "stylua" ];
        nix = [ "alejandra" ];
        cpp = [ "clang_format" ];
        # python = [ "black" ];
        # json = [ "jq" ];
        yaml = [ "prettierd" ];
        markdown = [ "prettierd" ];
        javascript = [ "prettierd" ];
        javascriptreact = [ "prettierd" ];
        typescript = [ "prettierd" ];
        typescriptreact = [ "prettierd" ];
        rust = [ "rustfmt" ];
        go = [ "gofmt" ];
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      settings = {
        format_on_save = null; # Disable format on save
        formatters = {
          shellcheck = {
            command = lib.getExe pkgs.shellcheck;
          };
          shfmt = {
            command = lib.getExe pkgs.shfmt;
          };
          shellharden = {
            command = lib.getExe pkgs.shellharden;
          };
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
          clang_format = {
            command = lib.getExe pkgs.vimPlugins.vim-clang-format;
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
          };
          prettierd = {
            command = lib.getExe pkgs.prettierd;
          };
          rustfmt = {
            command = lib.getExe pkgs.rustfmt;
          };
          gofmt = {
            command = lib.getExe pkgs.emacsPackages.gofmt-tag;
          };
          alejandra = {
            command = lib.getExe pkgs.alejandra;
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n"; 
        key = "<leader>p";
        action = ":lua require('conform').format()<CR>";
        options = {
          silent = true;
          noremap = true;
          desc = "[F]ormat this buffer";
        };
      }
    ];
}

