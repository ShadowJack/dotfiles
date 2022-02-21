vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function() 
	use 'wbthomason/packer.nvim'

	-- common
	use 'scrooloose/nerdtree' -- file tree
	use 'vim-airline/vim-airline' -- additional info in the powerline
	use 'vim-airline/vim-airline-themes'
	use 'ajmwagar/vim-deus' -- airline color theme
	use 'haystackandroid/snow' -- general color theme
	use 'easymotion/vim-easymotion' -- fast navigation
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fuzzy search of files
	-- a popup window with lots of useful staff
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- general dev
	use 'scrooloose/nerdcommenter' -- toggle comments
	use 'jiangmiao/auto-pairs' -- auto-close brackets
	use 'ntpeters/vim-better-whitespace' -- show unnecessary trailing whitespaces
	use 'rhysd/git-messenger.vim' -- like a git blame in a popup
	use 'tpope/vim-sleuth' -- automatically adjust tab size based on the file type
	-- syntax parser that's used by other plugins
	use {
	    'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate'
	}
	use 'neovim/nvim-lspconfig' -- a collection of configurations for built-in LSP client
	use 'williamboman/nvim-lsp-installer' -- quickly install language servers
	use 'hrsh7th/nvim-cmp' -- autocompletion
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- snippets provider
	use 'honza/vim-snippets' -- a collection of snippets for lots of languages

	-- Elixir
	use { 'elixir-lang/vim-elixir', ft = 'elixir' }
	use { 'mattreduce/vim-mix', ft = 'elixir' }
end)
