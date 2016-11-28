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
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-endwise'
Plugin 'facebook/vim-flow'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'avdgaag/vim-phoenix'
Plugin 'greyblake/vim-preview'
Plugin 'tpope/vim-projectionist'
Plugin 'janko-m/vim-test'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nelstrom/vim-visual-star-search'


call vundle#end()
filetype plugin indent on

set number              " display line numbers

let g:jsx_ext_required = 0

let mapleader=","

set expandtab
set shiftwidth=2
set softtabstop=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start  

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
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

colorscheme railscasts
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

" Setup ultiSnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Setup easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Rum Neomake every time buffer is saved
autocmd! BufWritePost * Neomake

" Setup alchemist - provide path to elixir and erlang sources
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

" Setup Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
autocmd CompleteDone * pclose
set completeopt+=noinsert
inoremap <silent><expr> <TAB> pumvisible() ? "\<Down>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Create a cache for gutentag
let g:gutentags_cache_dir = '~/.tags_cache'

" Setup vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16_default"

" Setup ctrlp
let g:clear_cache_on_exit=0

nmap <Leader>t gt
