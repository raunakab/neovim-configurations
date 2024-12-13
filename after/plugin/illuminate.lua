-- # Overview
-- Highlights all other tokens which match the token underneath your cursor currently.
-- E.g., if you're on a token named "match", all other instances of "match" will be highlighted.
--
-- # Note
-- This extension preserves syntactical context; i.e., if you have a raw identifier named "match", then that will *not* be highlighted.
--
-- # Example
-- ```rs
-- let result1 = match () { () => () };
-- let result2 = match () { () => () };
-- let string = "match";
-- ```
--
-- If your cursor is on the "match" token, only the tokens (and *not* the instance of "match" inside of the string) will be highlighted.

require('illuminate').configure({
    should_enable = function()
        local mode = vim.api.nvim_get_mode().mode
        return mode ~= "v" and mode ~= "V" and mode ~= "\22"
    end,
})
