"        ____ ____ ____ ____ 
"       ||; |||V |||i |||m ||
"       ||__|||__|||__|||__||
"       |/__\|/__\|/__\|/__\|

" Set Leader
let mapleader = ";"
" Set Bar Colorscheme
let bar_cs = "gruvbox"
" Set Light/Dark Mode
set background=dark

" ================ Autoinstall vim-plug ============
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" ================ Plugins ========================
call plug#begin('~/.vim/plugged')

" --- Colorschemes ---
" (You can set the colorscheme on the bottom of this config)
Plug 'arcticicestudio/nord-vim'
Plug 'lisposter/vim-blackboard'
Plug 'morhetz/gruvbox'
" - for bar
Plug 'shinchu/lightline-gruvbox.vim'

" --- Startpage ---
Plug 'mhinz/vim-startify'

" --- Bar ---
Plug 'https://github.com/itchyny/lightline.vim'

" --- Appearance Tweaks ---
Plug 'ap/vim-css-color'
Plug 'kien/rainbow_parentheses.vim'
Plug 'RRethy/vim-illuminate'

" --- File Explorers / File Tree ---
Plug 'vifm/vifm.vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" --- File Finders ---
Plug 'junegunn/fzf.vim'
Plug 'https://git::@github.com/ctrlpvim/ctrlp.vim'

" --- Autocompletion 
Plug 'mattn/emmet-vim'

" --- Syntax ---
Plug 'dense-analysis/ale'
Plug 'vim-crystal/vim-crystal'

" --- Git --
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'mbbill/undotree'

" --- LaTeX ---
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" --- Manual Pages ---
Plug 'vim-utils/vim-man'

" --- Commenting ---
Plug 'tpope/vim-commentary'

" --- Zen ---
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" --- Experimental ---
Plug 'szw/vim-maximizer'
Plug 'https://devhub.art/space-lang/space.vim'

" -==========- Disabled -==========-
" --- Terminal ---
" Plug 'skywind3000/vim-terminal-help'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jiangmiao/auto-pairs'
" Plug 'lyuts/vim-rtags'
" Plug 'christoomey/vim-system-copy'
" Plug 'vimwiki/vimwiki'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'jremmen/vim-ripgrep'
" Plug 'zxqfl/tabnine-vim'
" --- Indent Lines ---
" Plug 'Yggdroot/indentLine'
" --- Discord RP ---
" Plug 'vimsence/vimsence'
" --- Movement --
" Plug 'easymotion/vim-easymotion'
" Plug 'shinchu/lightline-gruvbox.vim'
" --- Formatters ---
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'branch': 'release/0.x'
"   \ }

call plug#end()

syntax on

set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set number relativenumber
set nowrap
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set history=500
set noswapfile
set nobackup
set nowb
set autoread
set fillchars+=vert:\▏

" ================ Environement Variables ==========
let $MYVIMRC="$HOME/.vimrc"
let $MYDOTFILES="$HOME/.dotfiles"

" ================ Custom Commands =================
command! Config execute ":e $MYVIMRC" 
command! Dots execute ":e $MYDOTFILES"
command! Reload execute ":source $MYVIMRC"
command! TexP execute "LLPStartPreview"
command! RPC execute ":DiscordReconnect"
command! RPCoff execute ":DiscordDisconnect"

" ================ Custom Keymaps ==================
nnoremap <Leader>e :Vifm<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <C-G> :Goyo<CR>
nnoremap <Leader>m :MaximizerToggle<CR>

nmap <silent> <C-L> <C-L>:nohlsearch<CR>:match<CR>:diffupdate<CR>

map <Leader>h :wincmd h<CR>
map <Leader>j :wincmd j<CR>
map <Leader>k :wincmd k<CR>
map <Leader>l :wincmd l<CR>

" ================ startify ========================
let g:startify_custom_header = [
            \'     ____ ____ ____ ____ ',
            \'    ||; |||V |||i |||m ||',
            \'    ||__|||__|||__|||__||',
            \'    |/__\|/__\|/__\|/__\|',
            \ ]

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Recent Files']   },
          \ ]

let g:startify_bookmarks = [
            \ { 'p': '~/Projects' },
            \ { 'd': '~/.dotfiles' },
            \ ]

let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
 if has('persistent_undo')
   silent !mkdir ~/.vim/backups > /dev/null 2>&1
     set undodir=~/.vim/backups
       set undofile
       endif

" ================ LightLine =================
let g:lightline = {
      \ 'colorscheme': bar_cs,
      \ }
set laststatus=2

" ================ NerdTree  =================
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

nnoremap <Leader>f :NERDTreeToggle<CR>

" --- nerdtree-git-plugin ---
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" ================ IndentLine ==================
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_color_term = 240
" Indent Line Chars: ['|', '¦', '┆', '┊', '▏', '⎸']
let g:indentLine_char = '┆'

" ================ LimeLight ==================
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" ================ Vimsence ==================
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'Vim'
let g:vimsence_small_image = 'vim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In FileTree'
let g:vimsence_file_explorer_details = 'Looking for files'
" let g:vimsence_custom_icons = {'filetype': 'iconname'}

" ================ vim-latex-live-preview ==================
let g:livepreview_previewer = 'zathura'

" ================ Colorscheme =================
colorscheme gruvbox
