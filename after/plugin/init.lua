-- colours

vim.cmd.colorscheme('ayu')

-- harpoon

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>ff', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>fa', mark.add_file)
vim.keymap.set('n', '<leader>fh', ui.nav_prev)
vim.keymap.set('n', '<leader>fl', ui.nav_next)

-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>pg', builtin.git_files)
vim.keymap.set('n', '<leader>ps', builtin.grep_string)

-- undotree

vim.keymap.set('n', '<leader>cu', vim.cmd.UndotreeToggle)

