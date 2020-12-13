" ██╗    ██╗   ██╗██╗███╗   ███╗
" ██║    ██║   ██║██║████╗ ████║
" ██║    ██║   ██║██║██╔████╔██║
" ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
" ███████╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

" Forked from https://github.com/krissemicolon/.dotfiles
" Find this Fork on https://github.com/lianstuder/.dotfiles                          

" Set Leader
let mapleader = "-"

" ================ Autoinstall vim-plug ============
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" ================ Plugins ========================
call plug#begin('~/.vim/plugged')

" --- Colorschemes ---
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" --- Startpage ---
Plug 'mhinz/vim-startify'

" --- Bar ---
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" --- Indent Lines ---
Plug 'Yggdroot/indentLine'

" --- Other Appearance Tweaks ---
Plug 'ap/vim-css-color'
Plug 'kien/rainbow_parentheses.vim'

" --- File Explorers / File Tree ---
Plug 'vifm/vifm.vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" --- File Finders ---
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'https://git::@github.com/ctrlpvim/ctrlp.vim'

" --- Autocompletion 
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'zxqfl/tabnine-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'

" --- Syntax ---
Plug 'dense-analysis/ale'

" --- Git --
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'mbbill/undotree'

" --- Manual Pages ---
Plug 'vim-utils/vim-man'

" --- Movement --
Plug 'easymotion/vim-easymotion'

" --- Terminal ---
Plug 'skywind3000/vim-terminal-help'

" --- Commenting ---
Plug 'tpope/vim-commentary'

" --- Focusing ---
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" --- Experimental ---
Plug 'szw/vim-maximizer'
Plug 'itchyny/calendar.vim'

" --- Disabled --
" Plug 'lyuts/vim-rtags'
" Plug 'christoomey/vim-system-copy'
" Plug 'vimwiki/vimwiki'
Plug 'hugolgst/vimsence'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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
let $MYBASHRC="$HOME/.bashrc"
let $MYBSPWMRC="$HOME/.config/bspwm/bspwmrc"
let $MYSXHKDRC="$HOME/.config/sxhkd/sxhkdrc"

" ================ Custom Commands =================
command! Vimrc execute ":e $MYVIMRC" 
command! Bashrc execute ":e $MYBASHRC" 
command! Bspwmrc execute ":e $MYBSPWMRC" 
command! Sxhkdrc execute ":e $MYSXHKDRC" 

" ================ Custom Keymaps ==================
nnoremap <Leader>e :Vifm<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <C-G> :Goyo<CR>
nnoremap <Leader>m :MaximizerToggle<CR>

map <Leader>h :wincmd h<CR>
map <Leader>j :wincmd j<CR>
map <Leader>k :wincmd k<CR>
map <Leader>l :wincmd l<CR>

" ================ startify ========================
let g:startify_custom_header = [
  \'',
  \'    ██╗    ██╗   ██╗██╗███╗   ███╗ ',
  \'    ██║    ██║   ██║██║████╗ ████║ ',
  \'    ██║    ██║   ██║██║██╔████╔██║ ',
  \'    ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║ ',
  \'    ███████╗╚████╔╝ ██║██║ ╚═╝ ██║ ',
  \'    ╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
  \'',
  \]

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
 if has('persistent_undo')
   silent !mkdir ~/.vim/backups > /dev/null 2>&1
     set undodir=~/.vim/backups
       set undofile
       endif

" ================ LightLine =================
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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

" ================ Terminal ===================
let g:terminal_key = "<Leader>c"
let g:terminal_cwd = 1
let g:terminal_height = 10
let g:terminal_pos = "rightbelow"
let g:terminal_shell = "zsh"
let g:terminal_edit = "tab drop"
let g:terminal_kill = "term"
let g:terminal_list = 0
let g:terminal_fixheight = 1
let g:terminal_close = 0

" ================ IndentLine ==================
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_color_term = 240
" Indent Line Chars: ['|', '¦', '┆', '┊', '▏', '⎸']
let g:indentLine_char = '┆'

" ================ LimeLight ==================
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ================ Vimsence ==================
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'Vim'
let g:vimsence_small_image = 'vim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In FileTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}

" ================ Colorscheme =================
colorscheme gruvbox
set background=dark

