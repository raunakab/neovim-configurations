vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

function both(alias, original)
    vim.keymap.set('n', alias, original)
    vim.keymap.set('v', alias, original)
end

both('L', 'g_')
both('H', '^')
both('{', 'gg')
both('}', 'G')
both('m', '%')
both('<C-j>', '<C-e>')
both('<C-k>', '<C-y>')

vim.keymap.set('n', 'o', 'o<Esc>')
vim.keymap.set('n', 'O', 'O<Esc>')

vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wl', '<C-w>l')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wj', '<C-w>j')

vim.keymap.set('n', '<leader>ch', '<C-o>')
vim.keymap.set('n', '<leader>cl', '<C-i>')

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.scrolloff = 20
