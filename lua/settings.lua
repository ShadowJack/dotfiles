vim.g.mapleader=',' -- set Leader key

vim.cmd('filetype plugin indent on') -- enable filetype detection
vim.cmd('syntax on') -- enable syntax highlighting

vim.filetype.add({
  extension = {
    -- setup custom filetypes for Defold game engine
    script = 'lua',
    gui_script = 'lua',
    render_script = 'lua',
    editor_script = 'lua',
    vsh = 'glsl',
    fsh = 'glsl',
    fp = 'glsl',
    vp = 'glsl'
  }
})
-- set tab width for heex files
vim.cmd('autocmd Filetype heex setlocal tabstop=4')
-- set tab width for lua files
vim.cmd('autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab')
-- set tab width for js/ts files
vim.cmd('autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab')
vim.cmd('autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab')

vim.o.number=true -- display line numbers
vim.o.clipboard='unnamed' -- setup clipboard in MacOS


-- general color theme
vim.o.background='dark'
-- configure themes
vim.cmd[[
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif

  " Configuration options for sonokai.
  let g:sonokai_style = 'shusia'
  let g:sonokai_better_performance = 1

  " Configuration options for everforest.
  let g:everforest_background = 'hard'
  let g:everforest_better_performance = 1
]]
-- vim.cmd('colorscheme terafox') --nightfox/dawnfox/nordfox/terafox/
 --vim.cmd('colorscheme sonokai')
vim.cmd('colorscheme everforest') --everforest
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
vim.o.foldlevel = 9 -- limit folding to 4 levels
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

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


-- Plugins --
--

-- NERDTree
vim.g.NERDTreeNodeDelimiter='\t'

-- NERDCommenter
-- Align line-wise comment delimiters flush left instead of following code
-- indentation
vim.g.NERDDefaultAlign='left'
 --Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims=1
-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines=1

-- EasyMotion
-- Disable default mappings
vim.g.EasyMotion_do_mapping=0
-- Turn on case insensitive feature
vim.g.EasyMotion_smartcase=1
