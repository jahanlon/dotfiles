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
      for _,lang in ipairs(langs) do
        vim.lsp.enable(lang)
      end
    end
  }
}

