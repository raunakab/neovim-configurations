local utils = require('utils')

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    renderer = {
        group_empty = true,
    },
})
vim.keymap.set('n', utils.project_scope('v'), function() vim.cmd('NvimTreeToggle') end)
vim.keymap.set('n', utils.project_scope('x'), function()
    vim.cmd('NvimTreeOpen')
    vim.cmd('NvimTreeCollapse')
end)
