-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Add plugins
require('lazy').setup({
    -- file tree
    'nvim-tree/nvim-tree.lua',

    -- tabs
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
    },

    -- git commands in nvim
    'tpope/vim-fugitive',

    -- fugitive-companion to interact with github
    'tpope/vim-rhubarb',

    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',

    -- more modern netrw
    'stevearc/oil.nvim',

    -- colorscheme
    'Luxed/ayu-vim',

    -- fancier statusline
    'nvim-lualine/lualine.nvim',

    -- add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',

    -- add git related info in the signs columns and popups
    'lewis6991/gitsigns.nvim',

    -- highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',

    -- additional textobjects for treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- collection of configurations for built-in LSP client
    'neovim/nvim-lspconfig',

    -- automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',

    -- ibid
    'williamboman/mason-lspconfig.nvim',

    -- lua language server configuration for nvim
    'folke/neodev.nvim',

    -- autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },

    -- fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.
        build = 'make',
    },

    -- line folding (with lsp integrations)
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
    },

    -- pretty line folding
    'anuvyklack/pretty-fold.nvim',

    -- token illumination
    'RRethy/vim-illuminate',

    -- undo tree
    'mbbill/undotree',

    -- inline git blame
    'f-person/git-blame.nvim',
}, {})

-- remap utils
local function with_leader_and_prefix(prefix)
    local scoped = string.format("<leader>%s", prefix)
    return function(command) return string.format("%s%s", scoped, command) end
end
local function with_prefix(prefix)
    return function(command) return string.format("%s%s", prefix, command) end
end
local window_scope = with_leader_and_prefix('w')
local search_scope = with_leader_and_prefix('s')
local project_explorer_scope = with_leader_and_prefix('x')('')
local project_explorer_collapsed_scope = with_leader_and_prefix('c')('')
local project_files_scope = with_leader_and_prefix('f')('')
local project_git_files_scope = with_leader_and_prefix('g')('')
local buffer_list_buffers_scope = with_leader_and_prefix('<space>')('')
local buffer_scope = with_leader_and_prefix('b')
local diagnostics_show_scope = with_leader_and_prefix('e')('')
local diagnostics_show_all_scope = with_leader_and_prefix('E')('')
local hover_scope = with_leader_and_prefix('k')('')
local hover_more_info_scope = with_leader_and_prefix('K')('')
local rename_scope = with_leader_and_prefix('r')('')
local code_format_scope = with_leader_and_prefix('m')('')
local folding_scope = with_prefix('z')
local goto_scope = with_prefix('g')
local undo_toggle_view_scope = with_leader_and_prefix('u')('')

local move_up = 'k'
local move_far_up = 'K'
local move_down = 'j'
local move_far_down = 'J'
local move_far_left = "H"
local move_far_right = "L"
local move_file_top = "{"
local move_file_bottom = "}"
local move_matching = "m"

local scroll_down = "<C-j>"
local scroll_up = "<C-k>"

local insert_newline_top = "O"
local insert_newline_bottom = "o"

local window_move_left = window_scope('h')
local window_move_right = window_scope('l')
local window_move_up = window_scope('k')
local window_move_down = window_scope('j')
local window_new_right = window_scope('L')
local window_new_bottom = window_scope('J')
local window_close = window_scope('q')
local window_close_others = window_scope('Q')

local code_previous_location = '[c'
local code_next_location = ']c'
local code_hover = hover_scope
local code_hover_more_info = hover_more_info_scope
local code_rename = rename_scope
local code_format = code_format_scope

local git_previous_location = '[g'
local git_next_location = ']g'

local project_dir = '-'
local project_explorer = project_explorer_scope
local project_explorer_collapsed = project_explorer_collapsed_scope
local project_files = project_files_scope
local project_git_files = project_git_files_scope

local buffer_list_buffers = buffer_list_buffers_scope
local buffer_close_buffer = buffer_scope('q')
local buffer_close_buffer_forced = buffer_scope('Q')
local buffer_next_buffer = '[b'
local buffer_previous_buffer = ']b'

local search_buffer = search_scope('b')
local search_project = search_scope('p')

local diagnostics_show = diagnostics_show_scope
local diagnostics_show_all = diagnostics_show_all_scope
local diagnostics_previous_location = '[e'
local diagnostics_next_location = ']e'

-- local goto_implementation = goto_scope('i')
-- local goto_declaration = goto_scope('D')
local goto_definition = goto_scope('d')
local goto_references = goto_scope('r')
local goto_symbols = goto_scope('s')

local completion_enter = '<CR>'
local completion_previous = '<S-Tab>'
local completion_next = '<Tab>'
local completion_complete = "<C-Space>"
local completion_scroll_docs_down = "<C-d>"
local completion_scroll_docs_up = "<C-e>"

local folding_close_all = folding_scope('C')
local folding_open_all = folding_scope('O')

local undo_reundo = 'U'
local undo_toggle_view = undo_toggle_view_scope

local yank_to_clipboard = 'Y'

-- Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.keymap.set({ 'n', 'v' }, folding_close_all, 'zM')
vim.keymap.set({ 'n', 'v' }, folding_open_all, 'zR')

-- basic movements
vim.keymap.set({ 'n', 'v' }, move_far_left, '^')
vim.keymap.set('n', move_far_right, '$')
vim.keymap.set('v', move_far_right, '$h')
vim.keymap.set({ 'n', 'v' }, move_file_top, 'gg')
vim.keymap.set({ 'n', 'v' }, move_file_bottom, 'G')
vim.keymap.set({ 'n', 'v' }, move_matching, '%')

-- moving code
vim.keymap.set('v', move_far_up, ":m '<-2<CR>gv=gv")
vim.keymap.set('v', move_far_down, ":m '>+1<CR>gv=gv")

-- scrolling
vim.keymap.set({ 'n', 'v' }, scroll_up, '<C-e>')
vim.keymap.set({ 'n', 'v' }, scroll_down, '<C-y>')

-- newline insertion
vim.keymap.set('n', insert_newline_top, 'O<Esc>')
vim.keymap.set('n', insert_newline_bottom, 'o<Esc>')

-- window management
vim.keymap.set('n', window_move_left, '<C-w>h')
vim.keymap.set('n', window_move_right, '<C-w>l')
vim.keymap.set('n', window_move_up, '<C-w>k')
vim.keymap.set('n', window_move_down, '<C-w>j')
vim.keymap.set('n', window_new_right, function() vim.cmd("vsplit") end)
vim.keymap.set('n', window_new_bottom, function() vim.cmd("split") end)
vim.keymap.set('n', window_close, function() vim.cmd("close") end)
vim.keymap.set('n', window_close_others, function() vim.cmd("only") end)

-- jumping to previous marks
vim.keymap.set('n', code_previous_location, '<C-o>')
vim.keymap.set('n', code_next_location, '<C-i>')

-- line wrapping helpers
vim.keymap.set({ 'n', 'v' }, move_up, "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, move_down, "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffers
vim.keymap.set('n', buffer_close_buffer, function() vim.cmd('bd') end)
vim.keymap.set('n', buffer_close_buffer_forced, function() vim.cmd('bd!') end)
vim.keymap.set('n', buffer_next_buffer, function() vim.cmd('bn') end)
vim.keymap.set('n', buffer_previous_buffer, function() vim.cmd('bp') end)

-- undo
vim.keymap.set('n', undo_toggle_view, function() vim.cmd('UndotreeToggle') end)
vim.keymap.set('n', undo_reundo, '<C-r>')

-- yanking to clipboard
vim.keymap.set({ 'n', 'v' }, yank_to_clipboard, '"+y')

-- misc
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.scrolloff = 20
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.completeopt = 'menuone,noselect'

-- do not re-order;
-- order is important here
vim.o.termguicolors = true
vim.cmd.colorscheme 'ayu'

-- highlight on yank
-- (nicety)
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- plugin configurations

-- file tree
require('nvim-tree').setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    git = {
        ignore = false,
    },
})
vim.keymap.set({ 'n', 'v' }, project_explorer, function() vim.cmd('NvimTreeToggle') end)
vim.keymap.set({ 'n', 'v' }, project_explorer_collapsed, function() vim.cmd('NvimTreeCollapse') end)

-- tabs
require('barbar').setup({
    icons = {
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        },
    },
})

-- statusbar
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
}

-- comments
require('Comment').setup()

-- indent guides
require("ibl").setup({
    indent = { char = "┊" },
    whitespace = { remove_blankline_trail = false },
})

-- git signs in the line gutter
local gitsigns = require('gitsigns')
gitsigns.setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        vim.keymap.set('n', git_previous_location, function() gitsigns.nav_hunk('prev') end, { buffer = bufnr })
        vim.keymap.set('n', git_next_location, function() gitsigns.nav_hunk('next') end, { buffer = bufnr })
    end,
}

-- oil
local oil = require('oil')
oil.setup({
    view_options = {
        show_hidden = true,
    }
})
vim.keymap.set('n', project_dir, function() oil.open() end, { desc = 'Open parent directory' })

-- Telescope
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- telescope + fzf
require('telescope').load_extension('fzf')
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', buffer_list_buffers, function() telescope_builtin.buffers { sort_lastused = true } end)
vim.keymap.set('n', project_files, function() telescope_builtin.find_files { previewer = true } end)
vim.keymap.set('n', project_git_files, function() telescope_builtin.git_files { previewer = true } end)
vim.keymap.set('n', search_buffer, function() telescope_builtin.current_buffer_fuzzy_find() end)
vim.keymap.set('n', search_project, function() telescope_builtin.live_grep() end)
-- vim.keymap.set('n', '<leader>sh', function() require('telescope.builtin').help_tags() end)
-- vim.keymap.set('n', '<leader>st', function() require('telescope.builtin').tags() end)
-- vim.keymap.set('n', '<leader>sd', function() require('telescope.builtin').grep_string() end)
-- vim.keymap.set('n', '<leader>?', function() require('telescope.builtin').oldfiles() end)

-- treesitter configuration
-- (parsers must be installed manually via :TSInstall)
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
        },
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
})

-- diagnostic settings
vim.diagnostic.config {
    virtual_text = true,
    update_in_insert = true,
}
vim.keymap.set('n', diagnostics_show, vim.diagnostic.open_float)
vim.keymap.set('n', diagnostics_previous_location, vim.diagnostic.goto_prev)
vim.keymap.set('n', diagnostics_next_location, vim.diagnostic.goto_next)
vim.keymap.set('n', diagnostics_show_all, vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist)

-- setup mason
require('mason').setup()
require('mason-lspconfig').setup()

-- setup nvim-lspconfig
local lspconfig = require 'lspconfig'
local function on_attach(_, bufnr)
    local attach_opts = { silent = true, buffer = bufnr }
    if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { 0 })
    end
    -- vim.lsp.buf.inlay_hint(bufnr, true)

    -- vim.keymap.set({ 'n', 'v' }, goto_scope('i'), vim.lsp.buf.implementation, attach_opts)
    -- vim.keymap.set({ 'n', 'v' }, goto_scope('D'), vim.lsp.buf.declaration, attach_opts)
    vim.keymap.set({ 'n', 'v' }, goto_definition, vim.lsp.buf.definition, attach_opts)
    vim.keymap.set({ 'n', 'v' }, goto_references, require('telescope.builtin').lsp_references, attach_opts)
    vim.keymap.set({ 'n', 'v' }, goto_symbols, require('telescope.builtin').lsp_document_symbols, attach_opts)

    vim.keymap.set({ 'n', 'v' }, code_hover, vim.lsp.buf.hover, attach_opts)
    vim.keymap.set({ 'n', 'v' }, code_hover_more_info, vim.lsp.buf.signature_help, attach_opts)
    vim.keymap.set({ 'n', 'v' }, code_rename, vim.lsp.buf.rename, attach_opts)
    vim.keymap.set({ 'n', 'v' }, code_format, vim.lsp.buf.format, attach_opts)
    -- vim.keymap.set({ 'n', 'v' }, code_scope('t'), vim.lsp.buf.type_definition, attach_opts)

    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
    -- vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
end

-- nvim-cmp additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
require('ufo').setup()

-- enable language servers
-- if you want to see what servers are installed, try looking in these dirs:
-- * `~/.local/share/nvim/mason/bin`
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'taplo', 'yamlls', 'ruff' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- neovim configuration file lsp
require('neodev').setup()
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
            },
        },
    },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.setup()
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        [completion_scroll_docs_down] = cmp.mapping.scroll_docs(-4),
        [completion_scroll_docs_up] = cmp.mapping.scroll_docs(4),
        [completion_complete] = cmp.mapping.complete {},
        [completion_enter] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        [completion_next] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        [completion_previous] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

require('illuminate').configure({
    should_enable = function(_)
        local mode = vim.api.nvim_get_mode().mode
        return mode == "n"
    end,
})

vim.api.nvim_set_hl(0, "Visual", { bg = "#884444", fg = "NONE" })

require('gitblame').setup()
