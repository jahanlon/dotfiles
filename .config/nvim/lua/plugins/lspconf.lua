langs = {
  "lua_ls",
  "pyright",
  "bashls",
  "terraformls",
  "yamlls",
  "taplo",
  "powershell_es",
  "jsonls"
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = langs,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",

    config = function()

      local lspconf = require("lspconfig")
      for _,lang in ipairs(langs) do
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        lspconf[lang].setup({capabilities = capabilities})
      end
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    config = function()
      require("blink.cmp").setup({
        keymap = {

          preset = 'default',
          ['<Tab>']   = {'accept'},
          ['<Up>']    = { 'select_prev', 'fallback' },
          ['<Down>']  = { 'select_next', 'fallback' },
          ['<C-s>']   = {'show_documentation'},
        },

        completion = { documentation = { auto_show =true }},

        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }},
      })
    end
  }
}
