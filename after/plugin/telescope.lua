-- # Overview
-- Allows you to easily access various files across your open project.

local utils = require('utils')
local builtin = require('telescope.builtin')

vim.keymap.set('n', utils.project_scope('f'), builtin.find_files)
vim.keymap.set('n', utils.project_scope('g'), builtin.git_files)
vim.keymap.set('n', utils.project_scope('s'), builtin.live_grep)
vim.keymap.set('n', utils.buffer_scope('b'), builtin.buffers)
