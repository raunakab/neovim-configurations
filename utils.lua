local U = {}

local function alias(scope)
    local scoped = string.format("<leader>%s", scope)
    return function(command)
        return string.format("%s%s", scoped, command)
    end
end

-- For working with harpoon.
--
-- Supports:
-- * viewing harpoon list
-- * adding to harpoon list
-- * jumping to next file in harpoon list
-- * jumping to previous file in harpoon list
U.harpoon_scope = alias('h')

-- For helping with windowing.
--
-- Supports:
-- * jumping to the left window
-- * jumping to the right window
-- * jumping to the upper window
-- * jumping to the lower window
U.window_scope = alias('w')

-- For insights into this project's files.
--
-- Supports:
-- * finding files in a project
-- * finding git files in a project
-- * searching for a string in a project
U.project_scope = alias('p')

-- For working with raw text.
--
-- Supports:
-- * renaming
-- * formatting
U.code_scope = alias('c')

-- For working with open buffers.
-- This is neovim's take on "tabs" that GUI editors use.
--
-- Supports:
-- * listing all open buffers
U.buffer_scope = alias('b')

-- For "going to" symbols (using the lsp).
--
-- Supports:
-- * going to symbol definitions
-- * listing symbol references (globally) [and jumping to them]
-- * listing symbols (in the current buffer) [and going to them]
--
-- # Note
-- Will not work if the current buffer does not have an lsp attached to it.
U.goto_scope = function(command) return string.format('g%s', command) end

return U
