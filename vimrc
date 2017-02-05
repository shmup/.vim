" https://gitlab.com/shmup/vim

" You can jump between hunks with [c and ]c. 
" You can preview, stage, and undo hunks with 
" <leader>hp, <leader>hs, and <leader>hu respectively.
" You cannot currently unstage a staged hunk.

if has('win32')
    set runtimepath^=~/.vim  "Use instead of "vimfiles" on windows
endif

execute pathogen#infect()

let mapleader = "\<Space>"

colorscheme monokai

filetype plugin indent on
syntax enable

set autoindent
set autoread " nice for now cause at work I also edit in VS
set backspace=indent,eol,start
set clipboard+=unnamed
set complete-=i
set display+=lastline
set encoding=utf8
set expandtab
set foldmethod=syntax
set gdefault
set hlsearch
set hidden
set history=1000
set incsearch
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" set list listchars=tab:>-,trail:.,extends:>
silent! set formatoptions+=j " Delete comment character when joining commented lines
silent! set formatoptions+=r " Continue commenting when <return> in insert mode
set nrformats-=octal
set nowrap
" set mouse=a
" set number
" set relativenumber
set ruler
set scrolloff=2
set shiftwidth=4
set nojoinspaces
set sidescrolloff=5
set ignorecase
set shortmess+=I " do not display splash screen
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set ttyfast
set ttimeout
set ttimeoutlen=100
set wildmenu
set wildmode=list:longest,full
set t_ti= t_te= " prevent screen clearing
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp// " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim/junk/view//
set undofile
set undolevels=1000
set undoreload=10000

" vim things
noremap <silent> <leader>bo :w \| %bd \| e#<cr>
" read onto current line
" command -complete=file -nargs=1 R :-1r <args>
" noremap <silent> <leader>s :so ~/.vim/vimrc<cr>
noremap <silent> <leader>ev :e ~/.vim/vimrc<cr>
noremap <silent> <leader>rv :so ~/.vim/vimrc<cr>
" strip trailing whitespace from file
nnoremap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" ix.io binding
noremap <silent><leader>i :w !ix<cr>
" toggle gitgutter
nnoremap <silent><leader>g :GitGutterToggle<cr>
" toggle line numbers
nnoremap <silent><leader>n :set nu!<cr>
" toggle line numbers
nnoremap <silent><leader>w :set wrap!<cr>
" true maximize
nnoremap <C-w>\ <C-w>\|<C-w>_
" clear highlight
nnoremap <leader>l :nohlsearch<Bar>:echo<cr>
" better line select
nmap <leader><leader> V
" <f1> same as CTRL-g
nnoremap <f1> <C-^>
inoremap <f1> <esc><C-^>
" fu ex mode
nnoremap Q <nop>
" make Y like C/D
nnoremap Y y$
" more intuitive j/k
noremap j gj
noremap k gk
" sudo write
cmap w!! w !sudo tee > /dev/null %
" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" clipboard things
vmap <leader>y "+y
vmap <leader>d "+d
" tmux
if $TMUX == ''
    nmap <leader>p "+p
    nmap <leader>P "+P
    vmap <leader>p "+p
    vmap <leader>P "+P
    set clipboard+=unnamed
endif
" sudo save
cmap w!! %!sudo tee > /dev/null %
" better use of arrows
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
" re-hardwap paragraphs of text
nnoremap <leader>q gqap
" unwrap paragraphs of text
nnoremap <leader>u vipJjjj
" execute file being edited
noremap <buffer> <Leader>pl :!/usr/bin/perl % <CR>
noremap <buffer> <Leader>py :!/usr/bin/env python % <CR>
noremap <buffer> <Leader>sh :!/bin/bash % <CR>
" quick tab changing
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" supertab
let g:SuperTabDefaultCompletionType="context"
" ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
if getcwd() == '/c/work/code/northpointe-suite'
    let g:ctrlp_user_command = ['.git', "cd %s && git ls-files . -co --exclude-standard | grep '\\(cshtml\\|vb\\|cs\\|js\\|css\\)$'"]
endif
" let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>v :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" easy align
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" ag
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" tagbar
nmap <F8> :TagbarToggle<CR>
" syntastic
noremap <silent><leader>c :SyntasticToggleMode<cr> :SyntasticCheck<cr>
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/Public/briefcase/vimwiki'}]
" status line bullshit
set laststatus=2
hi statusline ctermbg=46 ctermfg=0
set statusline=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\    
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [\%l\/%L\:%c]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if has('gui_running')
  set lines=50
  set columns=120
  set guioptions-=m         " removes menu bar
  set guioptions-=T         " removes main toolbar
  set guioptions-=rRL       " removes vertical scrollbars
  set guioptions=aegit
  if has("gui_macvim")
    set guifont=Monaco:h13
  elseif has("gui_running")
    set guifont=Fira\ Mono\ Medium:h8
  else
    set guifont=Fira\ Mono\ Medium\ 8
  endif
endif

" Add the virtualenv's site-packages to vim path
if has("python")
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

augroup things
    au!
    " language shit
    au FileType python setlocal foldmethod=manual
    au FileType vim setlocal foldmethod=marker foldmarker={{{,}}}

    " only highlight the current window
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline

    " when editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

    " dcss map syntax
    au BufRead,BufNewFile *.des set syntax=levdes

    " get completions from current syntax file
    au BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')
    set iskeyword+=-,:

    " save folds
    au BufWinLeave *.* mkview!
    au BufWinEnter *.* silent loadview
augroup END
