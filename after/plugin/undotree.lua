-- # Overview
-- Creates an entire version-control-like structure of changes that you've made to the current buffer.

local utils = require('utils')

vim.keymap.set('n', utils.code_scope('u'), vim.cmd.UndotreeToggle)

