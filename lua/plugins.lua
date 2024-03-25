vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- common
	use 'scrooloose/nerdtree'                                       -- file tree
	use 'vim-airline/vim-airline'                                   -- additional info in the powerline
	use 'vim-airline/vim-airline-themes'
	use 'ajmwagar/vim-deus'                                         -- airline color theme
	use 'sainnhe/sonokai'                                           -- sonokai general color theme
	use 'EdenEast/nightfox.nvim'                                    -- nightfox general color theme
	use { 'sainnhe/everforest', tag = 'v0.2.3' }                    -- everforest general color theme
	use 'easymotion/vim-easymotion'                                 -- fast navigation
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fuzzy search of files
	-- a popup window with lots of useful staff
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'nvim-telescope/telescope-dap.nvim' -- integrate Debug Adapter Protocol client with Telescope
	use 'tpope/vim-surround'               -- surround text with pair of symbols
	use 'gcmt/taboo.vim'                   -- rename tabs conviniently

	-- general dev
	use 'github/copilot.vim'            -- copilot
	use 'scrooloose/nerdcommenter'      -- toggle comments
	use 'jiangmiao/auto-pairs'          -- auto-close brackets
	use 'RRethy/nvim-treesitter-endwise' -- automatically add 'end' keyword
	use 'ntpeters/vim-better-whitespace' -- show unnecessary trailing whitespaces
	use 'rhysd/git-messenger.vim'       -- like a git blame in a popup
	use 'tpope/vim-sleuth'              -- automatically adjust tab size based on the file type
	-- syntax parser that's used by other plugins
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'neovim/nvim-lspconfig'            -- a collection of configurations for built-in LSP client
	use 'mfussenegger/nvim-dap'            -- add debugging infrastructure
	use 'williamboman/mason.nvim'          -- quickly install language servers and other staff
	use 'williamboman/mason-lspconfig.nvim' -- setup language servers
	use 'jay-babu/mason-nvim-dap.nvim'     -- setup debugging adapters
	use 'hrsh7th/nvim-cmp'                 -- autocompletion
	use 'hrsh7th/cmp-nvim-lsp'             -- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer'               -- buffer source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip'         -- snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip'                 -- snippets provider
	use 'honza/vim-snippets'               -- a collection of snippets for lots of languages
	use 'wakatime/vim-wakatime'            -- tack time of usage
	use 'sunaku/vim-dasht'                 -- docs for different languages and frameworks in vim
	use "sindrets/diffview.nvim"           -- diff viewer for Git
	use "elentok/format-on-save.nvim"      -- format file on save

	-- Elixir
	use { 'elixir-lang/vim-elixir', ft = 'elixir' }
	use { 'mattreduce/vim-mix', ft = 'elixir' }

	-- MJML
	use { "ec965/mjml-preview.nvim", ft = { "mjml" }, run = "cd app && npm install" }
end)
