vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'Luxed/ayu-vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use(
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    )
    use 'nvim-treesitter/playground'
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'RRethy/vim-illuminate'
    use {
        'folke/noice.nvim',
        requires = { 'MunifTanjim/nui.nvim' }
    }
    use 'hrsh7th/nvim-cmp'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'romgrk/barbar.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        },
    }
    use 'tiagovla/scope.nvim'
end)
