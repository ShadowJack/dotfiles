set nocompatible        " use vim settings instead of vi
filetype off

" Setup Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
" :UpdateRemotePlugins should be run the first time deoplete is installed
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/echodoc.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'slashmili/alchemist.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neomake/neomake'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-endwise'
Plugin 'facebook/vim-flow'
Plugin 'avdgaag/vim-phoenix'
Plugin 'greyblake/vim-preview'
Plugin 'tpope/vim-projectionist'
Plugin 'janko-m/vim-test'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'jiangmiao/auto-pairs'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'mileszs/ack.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'OrangeT/vim-csharp'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'exitface/synthwave.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'nightsense/stellarized'
Plugin 'nightsense/vimspectr'
Plugin 'ajmwagar/vim-deus'
Plugin 'vimwiki/vimwiki'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elmcast/elm-vim'

call vundle#end()
filetype plugin indent on

set number              " display line numbers
set clipboard=unnamed   " setup for clipboard in MacOS

let g:jsx_ext_required = 0

let mapleader=","

set expandtab
set shiftwidth=2
set softtabstop=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start  

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set cursorline          " highlight current line being modified
set showcmd		" display incomplete commands

set hlsearch            " highlight searched elements
set incsearch		" do incremental searching
set ignorecase          " ignore case while searching
set showmatch           " highlight matching brackets
set smartcase           " ignore case if there is no Uppercase letters in the search pattern

set fileencoding=utf-8
"set encoding=utf-8

set gdefault            " always append g flag to replace command

set winwidth=80
set winheight=10
set winminheight=10
set winheight=999

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Set color scheme
" colorscheme deus
colorscheme synthwave

" Don't use Ex mode, use Q for formatting
map Q gq

" Map jj to escape into normal mode
:imap jj <Esc>

" Make cursor move by visual lines instead of file lines (when wrapping)
noremap k gk
noremap j gj

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Enable 24-bit colors
if (has("termguicolors"))
 set termguicolors
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default fdlent> <F3> :NERDTreeToggle<CR>iletype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Setup for syntastyc and elixir lang
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nmap <silent> \\ :nohlsearch<CR>

nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>

nmap <D-V> "+p

" Setup for vim-test plugin
nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Setup vim-flow
let g:flow#autoclose = 1
let g:javascript_plugin_flow = 1
let g:flow#enable = 0

" Setup ultiSnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Setup easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)


" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


" Enable credo maker for elixir
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Adjust flow maker for Neomake
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
function! FlowArgs()
  let g:file_path = expand('%:p')
  return ['-c', g:flow_path.' --json | flow-vim-quickfix']
".' check-contents '.g:file_path.' < '.g:file_path
endfunction
let g:flow_maker = {
\ 'exe': 'sh',
\ 'args': function('FlowArgs'),
\ 'errorformat': '%E%f:%l:%c\,%n: %m',
\ 'cwd': '%:p:h'
\ }
let g:neomake_javascript_enabled_makers = ['flow']
let g:neomake_jsx_enabled_makers = ['flow']
let g:neomake_javascript_flow_maker = g:flow_maker
let g:neomake_jsx_flow_maker = g:flow_maker

" Run Neomake every time buffer is saved
autocmd! BufWritePost * Neomake


" Setup alchemist - provide path to elixir and erlang sources
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"


" Setup Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#tag#cache_limit_size = 1000000
" make `around` source not very important
call deoplete#custom#source('around', 'rank', 1)
autocmd CompleteDone * pclose
set completeopt+=noinsert
inoremap <silent><expr> <TAB> pumvisible() ? "\<Down>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup()
" endfunction

" Don't show current mode in command line window so that echodoc
" can be visible
set noshowmode
set shortmess+=c

" Create a cache for gutentag
let g:gutentags_cache_dir = '~/.tags_cache'
set statusline+=%{gutentags#statusline()}

" Setup vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "deus"


" Setup ctrlp
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_match_window = 'bottom,order:ttb'

nmap <Leader>t gt

" Setup Elm support
let g:polyglot_disabled = ['elm']
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
