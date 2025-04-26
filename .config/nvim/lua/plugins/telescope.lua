return{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function()
        local tele = require("telescope.builtin")
        require("telescope").setup {
             pickers = {
                find_files = {
                 follow = true
                }
            }   
        }
        vim.keymap.set('n', '<C-p>', tele.find_files, {})
        vim.keymap.set('n', '<leader>fg', tele.live_grep, {})
    end
}
