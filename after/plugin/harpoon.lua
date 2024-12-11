local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ff', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>fa', mark.add_file)

vim.keymap.set('n', '<leader>fh', function() ui.nav_prev() end)
vim.keymap.set('n', '<leader>fl', function() ui.nav_next() end)

