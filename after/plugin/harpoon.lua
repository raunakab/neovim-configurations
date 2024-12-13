-- # Overview
-- Allows you to pick files to add to a special set of files which can be toggled through easily.

local utils = require('utils')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', utils.harpoon_scope('f'), ui.toggle_quick_menu)
vim.keymap.set('n', utils.harpoon_scope('a'), mark.add_file)
vim.keymap.set('n', utils.harpoon_scope('h'), ui.nav_prev)
vim.keymap.set('n', utils.harpoon_scope('l'), ui.nav_next)

