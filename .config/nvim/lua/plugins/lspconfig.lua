local langs = {
  "lua_ls",
  "terraformls",
  "yamlls",
  "bashls"}

return{
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
      ensure_installed = langs
    })
  end
},
{
  "neovim/nvim-lspconfig",
  config = function()
   lspconfig = require("lspconfig")
    for _, serv in ipairs(langs) do
        lspconfig[serv].setup({})
      end

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  end
}
}
