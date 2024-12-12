local lsp_config = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local util = require('lspconfig.util')

vim.opt.signcolumn = 'yes'

local lspconfig_defaults = lsp_config.util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities,
    cmp.default_capabilities())

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client ~= nil and client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
        end

        vim.lsp.inlay_hint.enable(true, { 0 })

        local opts = { buffer = event.buf }

        local function set(alias, command, visual_too)
            local mapped = string.format('<cmd>lua vim.lsp.buf.%s<cr>', command)
            vim.keymap.set('n', alias, mapped, opts)
            if visual_too and visual_too == true then
                vim.keymap.set('v', alias, mapped, opts)
            end
        end

        set('gd', 'definition()')
        set('gr', 'references()')
        set('gs', 'document_symbol()')
        set('<leader>ck', 'hover()')
        set('<leader>r', 'rename()', true)
        set('<leader>cf', 'format({async = true})')
    end,
})

lsp_config.lua_ls.setup({})
lsp_config.rust_analyzer.setup({})
lsp_config.gleam.setup({})
lsp_config.pyright.setup({})
lsp_config.ruff.setup({
    default_config = {
        cmd = { 'ruff', 'server' },
        filetypes = { 'python' },
        root_dir = util.root_pattern('pyproject.toml', 'ruff.toml', '.ruff.toml') or util.find_git_ancestor(),
        single_file_support = true,
        settings = {},
    },
})
lsp_config.taplo.setup({})
