"  ____  _   _ 
" |  _ \| \ | | Pradyun Narkadamilli
" | |_) |  \| | https://pradyungn.tech
" |  __/| |\  | MIT License
" |_|   |_| \_| Copyright 2020 Pradyun Narkadamilli

" Vim Keymap
" Main Vim Keybinds

" Set leader to space bar
let mapleader = " "
let maplocalleader = " "

" Window Navigation
" Navigate to left window.
nnoremap <C-h> <C-w>h
" Navigate to down window.
nnoremap <C-j> <C-w>j
" Navigate to top window.
nnoremap <C-k> <C-w>k
" Navigate to right window.
nnoremap <C-l> <C-w>l
" Horizontal split then move to bottom window.
nnoremap <Leader>v <C-w>s<C-w>j
" Vertical split then move to right window.
nnoremap <Leader>h <C-w>v<C-w>l
" Cycle tabs with Tab and Shift+Tab
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
" Kill buffer with Space+bk
nnoremap<silent> <Space>d :bdelete<CR> 
nnoremap<silent> <Space>D :bw!<CR>

" Indent controls
" Tab to indent in visual mode.
vnoremap <Tab> >gv
" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv

" Text alignment
nnoremap <silent> <Leader>Al :left<CR>
nnoremap <silent> <Leader>Ac :center<CR>
nnoremap <silent> <Leader>Ar :right<CR>

" Plugin specific keybinds
 
" COC Keybinds
" Remap keys for gotos
map <leader>cd <Plug>(coc-definition)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>cm <Plug>(coc-implementation)
map <leader>cr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>crn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
" Fix current line
nmap <leader>cfl  <Plug>(coc-fix-current)
" Using CocList
" Show all diagnostics
nnoremap  <Leader>cdi  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap  <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap  <Leader>cv  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <Leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> K :call <SID>docs()<CR>

" Dynamic Documentation
function! s:docs()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Tab and Shift+Tab dynamic autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Git keybinds
" Git status
nnoremap  <silent> <Leader>gs  :Gstatus<cr>
" Git diff in split window
nnoremap  <silent> <Leader>gd  :Git diff<cr>
" Git commit
nnoremap  <silent> <Leader>gc  :Gcommit<cr>
" Git push 
nnoremap  <silent> <Leader>gp  :Gpush<cr>
" Git pull 
nnoremap  <silent> <Leader>gP  :Gpull<cr>
" Git move 
nnoremap  <silent> <Leader>gm  :Gmove<cr>
" Git merge 
nnoremap  <silent> <Leader>gM  :Gmerge<cr>
" browse current file on web
nnoremap  <silent> <Leader>gb  :Gbrowse<cr>
" browse current line on web
nnoremap  <silent> <Leader>gl  :CocCommand git.browserOpen<cr>
" View chunk information in preview window. 
nnoremap  <silent> <Leader>gh  :CocCommand git.chunkInfo<cr>
" View commit information in preview window. 
nnoremap  <silent> <Leader>gg  :CocCommand git.showCommit<cr>
" Add all changes, hehe
nnoremap <silent> <Leader>ga :!git add --all<CR>
" View commits
nnoremap <silent> <Leader>gC :Commits<CR>

" NERD Commenter
" Toggle comments in visual or normal mode
nnoremap <silent> <leader>nn :call NERDComment(0,"toggle")<cr>
vnoremap <silent> <leader>nn :call NERDComment(1,"toggle")<cr>
" Toggle a sexy comment
nnoremap <silent> <leader>ns :call NERDComment(0,"sexy")<cr>
vnoremap <silent> <leader>ns :call NERDComment(1,"sexy")<cr>
" append a  comment
nnoremap <silent> <leader>na :call NERDComment(0,"append")<cr>
vnoremap <silent> <leader>na :call NERDComment(1,"append")<cr>
" uncomment section
nnoremap <silent> <leader>nu :call NERDComment(0,"uncomment")<cr>
vnoremap <silent> <leader>nu :call NERDComment(1,"uncomment")<cr>
" invert comments
nnoremap <silent> <leader>ni :call NERDComment(0,"invert")<cr>
vnoremap <silent> <leader>ni :call NERDComment(1,"invert")<cr>
" comment section
nnoremap <silent> <leader>nc :call NERDComment(0,"comment")<cr>
vnoremap <silent> <leader>nc :call NERDComment(1,"comment")<cr>

" Startify
nnoremap <silent> <Leader>ss :Startify<CR>

" Vista
" tag finder
nnoremap <silent> <Leader>f  :Vista<cr>

" Vimtex
nmap <silent> <Leader>lTc :VimtexCompile<cr>
vmap <silent> <Leader>lTs :VimtexCompileSelected<cr>
nmap <silent> <Leader>lTi :VimtexInfo<cr>
nmap <silent> <Leader>lTt :VimtexTocToggle<cr>
nmap <silent> <Leader>lTv :VimtexView<cr>

" Markdown preview
nmap <Leader>md <Plug>MarkdownPreviewToggle

" File Actions
nnoremap <silent> <Leader>w :w!<CR>

" Editor Keybinds
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>on :NERDTree<CR>
nnoremap <silent> <Leader>S :/<C-R><C-W> *<CR>

" Ripgrep go brrrrrr
nnoremap <silent> <Leader>rg :Rg<CR>

" Terminal mode escape-to-exit bind and launch
tnoremap <silent> <c-f> <c-\><c-n>
nnoremap <silent> <Leader>t :terminal<CR>

" FZF files ig (LMAO ITS SPACEX)
nnoremap <silent> <Leader>x :Files<CR>

" UndoTree
nnoremap <silent> <Leader>u :UndotreeShow<CR>:UndotreeFocus<CR>

" VimWiki Compilation - leader key set in settings
nnoremap <silent> <Leader>jc :VimwikiAll2HTML<CR>
