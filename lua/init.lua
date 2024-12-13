local utils = require('utils')

vim.g.mapleader = ' '
vim.keymap.set('n', utils.project_scope('v'), vim.cmd.Ex)

function both(alias, original)
    vim.keymap.set('n', alias, original)
    vim.keymap.set('v', alias, original)
end

vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', '$h')
both('H', '^')
both('{', 'gg')
both('}', 'G')
both('m', '%')
both('<C-j>', '<C-e>')
both('<C-k>', '<C-y>')

vim.keymap.set('n', 'o', 'o<Esc>')
vim.keymap.set('n', 'O', 'O<Esc>')
vim.keymap.set('n', utils.window_scope('h'), '<C-w>h')
vim.keymap.set('n', utils.window_scope('l'), '<C-w>l')
vim.keymap.set('n', utils.window_scope('k'), '<C-w>k')
vim.keymap.set('n', utils.window_scope('j'), '<C-w>j')
vim.keymap.set('n', utils.code_scope('h'), '<C-o>')
vim.keymap.set('n', utils.code_scope('l'), '<C-i>')

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.scrolloff = 20

vim.keymap.set('n', utils.window_scope('L'), function() vim.cmd("vsplit") end)
vim.keymap.set('n', utils.window_scope('J'), function() vim.cmd("split") end)
vim.keymap.set('n', utils.window_scope('x'), function() vim.cmd("close") end)
vim.keymap.set('n', utils.window_scope('X'), function() vim.cmd("only") end)
