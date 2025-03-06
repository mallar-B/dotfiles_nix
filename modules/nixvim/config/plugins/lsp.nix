{
  plugins = {
    lazydev.enable = true;
    luasnip.enable = true;
    lsp = {
      enable = true;
      servers = {
	gopls.enable = true;
	nixd.enable = true;
	rust_analyzer.enable = true;
	rust_analyzer.installCargo = true;
	rust_analyzer.installRustc = true;
	# tailwindcss.enable = true; # tailwind-tools will manage 
	ts_ls.enable = true;
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = false;
        settings.mapping = {
          "<C-n>" = { __raw = "cmp.mapping.select_next_item()"; };
          "<C-p>" = { __raw = "cmp.mapping.select_prev_item()"; };
          "<C-b>" = { __raw = "cmp.mapping.scroll_docs(-4)"; };
          "<C-f>" = { __raw = "cmp.mapping.scroll_docs(4)"; };
          "<C-y>" = { __raw = "cmp.mapping.confirm { select = true }"; };
          "<CR>" = { __raw = "cmp.mapping.confirm { select = true }"; };
    };
      # cmdline = {
      # "<C-n>".mapping = {__raw = "cmp.mapping.select_next_item()";} ;
      # "<C-p>".mapping = {__raw = "cmp.mapping.select_prev_item()";} ;
      # "<C-b>".mapping = {__raw = "cmp.mapping.scroll_docs(-4)";} ;
      # "<C-f>".mapping = {__raw = "cmp.mapping.scroll_docs(4)";} ;
      # "<C-y>".mapping = {__raw = "cmp.mapping.confirm { select = true }";} ;
      # "<CR>".mapping = {__raw = "cmp.mapping.confirm { select = true }";} ;
      # };
      settings.snippet.expand = ''
        function(args)
            require('luasnip').lsp_expand(args.body)
          end
      '';
      settings.completion =  { completeopt = "menu,menuone,noinsert"; };
      settings.sources = [
	{ name = "nvim_lsp"; }
        { name = "luasnip";}
	{ name = "path"; }
        { name = "nvim_lsp_signature_help";}
	{ 
	         name = "buffer"; 
	         option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
	}
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-emoji.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
  };
  autoCmd = [{
    event = "LspAttach";
    callback = {
      __raw = ''
        function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              callback = function(event2)
                vim.lsp.buf.clear_references()
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end
      '';
    };
  }];
  extraConfigLua = ''
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })
  '';
}

