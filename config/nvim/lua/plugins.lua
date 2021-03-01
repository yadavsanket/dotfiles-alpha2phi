return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Development
    use { 'tpope/vim-dispatch' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }
    use { 'wellle/targets.vim' }
    use { 'easymotion/vim-easymotion'}

    -- Color scheme
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'sainnhe/gruvbox-material' }
    use { 'joshdick/onedark.vim'}

    -- Testing
    use { 'vim-test/vim-test' }

    -- Fuzzy finder
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-telescope/telescope.nvim' }

    -- LSP and completion
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
    -- use { 'glepnir/lspsaga.nvim' }

    -- Snippets
    use { 'honza/vim-snippets' }
    use { 'SirVer/ultisnips' }
    use { 'norcalli/snippets.nvim' }
    use { 'nvim-telescope/telescope-snippets.nvim' }

    -- Lua development
    use { 'tjdevries/nlua.nvim' }

    -- Better syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
    use { 'nvim-treesitter/playground' }

    -- Dashboard
    use { 'glepnir/dashboard-nvim' }

    -- Status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'statusline' end,
    }

    -- DAP
    use { 'mfussenegger/nvim-dap' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'mfussenegger/nvim-dap-python' } -- Python

    -- Debugging
    use { 'puremourning/vimspector' }

    -- Project
    use { 'nvim-telescope/telescope-project.nvim' }


    -- Note taking
    -- use { 'oberblastmeister/neuron.nvim' }
    -- use { 'junegunn/fzf', run = '-> fzf#install()' }
    -- use { 'junegunn/fzf.vim'}
    -- use { 'fiatjaf/neuron.vim' }

    -- Code action light bulb
    -- use { 'kosayoda/nvim-lightbulb' }

    -- Embed in browser
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

    -- OSC 52 yank
    -- use { 'ojroques/vim-oscyank' }

    -- Jupyter Vim
    --use { 'jupyter-vim/jupyter-vim' }

    -- Scratch pad
    -- use { 'metakirby5/codi.vim' }

    -- Slime
    -- use { 'jpalardy/vim-slime' }

    -- Latex
    -- use { 'lervag/vimtex' }

    -- Floaterm
    -- use { 'voldikss/vim-floaterm' }

    -- Neoterm
    -- use { 'kassio/neoterm' }

    -- NeoFormat
    -- use { 'sbdchd/neoformat' }

    -- Better terminal
    -- use { 'nikvdp/neomux' }

end)

