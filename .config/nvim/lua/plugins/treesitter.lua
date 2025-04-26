return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()

        local tconfig = require("nvim-treesitter.configs")
        tconfig.setup({
            ensure_installed = {"lua"},
            highlight = { enable = true },
            indent = { enabled = true }})
    end
}
