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
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({
        completion = {
          autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        },
        mapping = require("cmp").mapping.preset.insert({
          ['<CR>'] = require("cmp").mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {'saghen/blink.cmp'},

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
      require("blink.cmp").setup()
    end
  }
}
