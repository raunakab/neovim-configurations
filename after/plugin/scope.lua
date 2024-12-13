require('scope').setup({
    hooks = {
        pre_tab_leave = function()
            vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabLeavePre' })
        end,

        post_tab_enter = function()
            vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabEnterPost' })
        end,
    },
})
local utils = require('utils')

vim.keymap.set('n', utils.buffer_scope('h'), function() vim.cmd('bprev') end)
vim.keymap.set('n', utils.buffer_scope('l'), function() vim.cmd('bnext') end)
vim.keymap.set('n', utils.buffer_scope('x'), function() vim.cmd('bdelete') end)
