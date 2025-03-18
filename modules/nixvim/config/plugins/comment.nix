{
  plugins.comment.enable = true;
  plugins.comment.settings = {
    ignore = "^const(.*)=(%s?)%((.*)%)(%s?)=>";
    opleader = {
      block = "gb";
      line = "gc";
    };
    pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    toggler = {
      block = "gbc";
      line = "gcc";
    };
  };

  plugins.ts-context-commentstring.enable = true;
  plugins.ts-context-commentstring.languages = {
    javascript = {
      __default = "// %s";
      jsx_element = "{/* %s */}";
      jsx_fragment = "{/* %s */}";
      jsx_attribute = "// %s";
      comment = "// %s";
    };
    typescript = {
      __default = "// %s";
      tsx_element = "{/* %s */}";
      tsx_fragment = "{/* %s */}";
      tsx_attribute = "// %s";
      comment = "// %s";
    };
  };
}
