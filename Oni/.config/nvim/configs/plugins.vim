"  ____  _   _
" |  _ \| \ | | Pradyun Narkadamilli
" | |_) |  \| | https://pradyungn.tech
" |  __/| |\  | MIT License
" |_|   |_| \_| Copyright 2020 Pradyun Narkadamilli

" Plugins
" Installing/Loading all the plugins used

" Install vim-plugged if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" Snippets for ultisnips
Plug 'honza/vim-snippets'

" Vim Surround
Plug 'tpope/vim-surround'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

"" Indent guides
Plug 'Yggdroot/indentLine'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Custom start page
Plug 'mhinz/vim-startify'

" Vim Javascript
Plug 'pangloss/vim-javascript'

" CSS Strings
Plug 'styled-components/vim-styled-components', {'branch': 'main'}


" Vim Polyglot (Programming Lanugage Pack - very OP)
let g:polyglot_disabled = ['latex']

Plug 'sheerun/vim-polyglot'

" Status bar
 " Plug 'vim-airline/vim-airline'

" Tabular auto-align
Plug 'godlygeek/tabular'

" Add DevIcons
Plug 'ryanoasis/vim-devicons'

" Tagbar
Plug 'liuchengxu/vista.vim'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" goyo distraction free mode
Plug 'junegunn/goyo.vim'

" LaTeX support
Plug 'lervag/vimtex'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"Clang Format
Plug 'sbdchd/neoformat'

" Arduino plugins
Plug 'sudar/vim-arduino-snippets'

" Vim TMUX Integration
Plug 'christoomey/vim-tmux-navigator'

" Emmet
Plug 'mattn/emmet-vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim-Be-Good
Plug 'ThePrimeagen/vim-be-good'

" CtrlP
Plug 'kien/ctrlp.vim'

" Undo Tree (Edit history)
Plug 'mbbill/undotree'

" VimWiki
Plug 'vimwiki/vimwiki'

" VimTeX reload
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Mountain theme :)
Plug 'pradyungn/Mountain', { 'rtp': 'vim' }

" Alignment plugin
Plug 'junegunn/vim-easy-align'

call plug#end()
