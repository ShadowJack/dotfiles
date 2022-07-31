vim.g.mapleader=',' -- set Leader key

vim.cmd('filetype plugin indent on') -- enable filetype detection
vim.cmd('syntax on') -- enable syntax highlighting

vim.o.number=true -- display line numbers
vim.o.clipboard='unnamed' -- setup clipboard in MacOS

-- general color theme
vim.o.background='dark'
vim.cmd('colorscheme snow')
-- airline colors
vim.g.airline_powerline_fonts=1
vim.g.airline_theme='deus'


-- common settings
vim.o.backspace='indent,eol,start' -- backspacing over everything in insert mode
vim.o.history=50 -- keep 50 lines of command line history
vim.o.ruler=true	-- show the cursor position all the time
vim.o.cursorline=true -- highlight current line being modified
vim.o.showcmd=true -- display incomplete commands
vim.o.hlsearch=true -- highlight searched elements
vim.o.incsearch=true -- do incremental searching
vim.o.ignorecase=true -- ignore case while searching
vim.o.showmatch=true -- highlight matching brackets
vim.o.smartcase=true -- ignore case if there is no Uppercase letters in the search pattern
vim.o.fileencoding='utf-8' -- use utf8 as default encoding
vim.o.gdefault=true -- always append g flag to replace command
vim.o.mouse='a' -- enable mouse

-- folding
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds

-- window size restrictions
vim.o.winwidth=80
vim.o.winheight=10
vim.o.winminheight=10
vim.o.winheight=999

--[[
For all text files set 'textwidth' to 78 characters.

When editing a file, always jump to the last known cursor position.
Don't do it when the position is invalid or when inside an event handler
(happens when dropping a file on gvim).
Also don't do it when the mark is in the first line, that is the default
position when opening a file.
]]--
vim.cmd([[
  augroup vimrcEx
    au!

    autocmd FileType text setlocal textwidth=78

    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END
]])

-- set line width for heex files
vim.cmd('autocmd Filetype heex setlocal tabstop=4')

-- Plugins --
--

-- NERDTree
vim.g.NERDTreeNodeDelimiter='\t'

-- NERDCommenter
-- Align line-wise comment delimiters flush left instead of following code
-- indentation
vim.g.NERDDefaultAlign='left'
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims=1
-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines=1

-- EasyMotion
-- Disable default mappings
vim.g.EasyMotion_do_mapping=0
-- Turn on case insensitive feature
vim.g.EasyMotion_smartcase=1
