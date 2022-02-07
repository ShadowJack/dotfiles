set nocompatible        " use vim settings instead of vi
filetype off

" Setup vim-plug
"
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jpo/vim-railscasts-theme'
Plug 'vim-syntastic/syntastic'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'tpope/vim-endwise' - not compatible with coc.nvim
Plug 'facebook/vim-flow'
Plug 'avdgaag/vim-phoenix'
Plug 'greyblake/vim-preview'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nelstrom/vim-visual-star-search'
Plug 'jiangmiao/auto-pairs'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'mileszs/ack.vim'
Plug 'elixir-editors/vim-elixir'
" Plug 'OrangeT/vim-csharp'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'exitface/synthwave.vim'
Plug 'mhartington/oceanic-next'
Plug 'nightsense/stellarized'
Plug 'nightsense/vimspectr'
Plug 'ajmwagar/vim-deus'
Plug 'vimwiki/vimwiki'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elmcast/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'sts10/vim-pink-moon'
" Plug 'aradunovic/perun.vim'
Plug 'nightsense/snow'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'andyl/vim-projectionist-elixir'
Plug 'beyondmarc/hlsl.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhinz/vim-mix-format'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
call plug#end()

filetype plugin indent on

set number              " display line numbers
set clipboard=unnamed   " setup for clipboard in MacOS

let g:jsx_ext_required = 0

let mapleader=","

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

" Enable 24-bit colors
if (has("termguicolors"))
 set termguicolors
endif

" Set colors 
set background=dark
colorscheme snow

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
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
" make test commands execute using vimux
let test#strategy = "vimux"

" Setup vim-flow
let g:flow#autoclose = 1
let g:javascript_plugin_flow = 1
let g:flow#enable = 0

" Setup coc-snippet
" Use <leader><tab> for trigger snippet expand.
imap <leader><tab> <Plug>(coc-snippets-expand)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'


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

" Setup NERDTree so that it doesn't complain about wrong characters
let g:NERDTreeNodeDelimiter = "\t"


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
" let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

"""""" 
" Setup CoC
" 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use outline
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



"""""""


" Don't show current mode in command line window so that echodoc
" can be visible
set noshowmode
set shortmess+=c

" Configure gutentags
let g:gutentags_ctags_exclude = ['node_modules']
let g:gutentags_exclude_filetypes = ['dockerfile']
let g:gutentags_cache_dir = '~/.tags_cache'
set statusline+=%{gutentags#statusline()}

" Setup vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'


" Setup ctrlp
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_match_window = 'bottom,order:ttb'

nmap <Leader>t gt

" Setup Elm support
let g:polyglot_disabled = ['elm']
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1


""" Setup for OmniSharp
let g:OmniSharp_server_use_mono = 1

" Setup mix-format
" let g:mix_format_on_save = 1

