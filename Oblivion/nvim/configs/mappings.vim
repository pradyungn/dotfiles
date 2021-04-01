"###################################################################################
"       __  ___                      _                    
"      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
"     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
"    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  ) 
"   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/  
"                 /_/    /_/               /____/         
"
"###################################################################################

"***********************************************************************************

" Main Vim Keybinds *********************************************************************************** 

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
  nnoremap <Leader>hh <C-w>v<C-w>l
" Cycle tabs with Tab and Shift+Tab
nnoremap<silent> <Tab> :bnext<CR>
nnoremap<silent> <S-Tab> :bprevious<CR>
" Kill buffer with Space+bk
nnoremap<silent> <Space>bk :bdelete<CR> 

nnoremap<silent> F :NERDTree<CR>
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>
nnoremap <silent> <Leader>S :/<C-R><C-W> *<CR>

" Indent controls
" Reselect text ater indent/unindent.
vnoremap < <gv
vnoremap > >gv
" Tab to indent in visual mode.
vnoremap <Tab> >gv
" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv

" Text alignment
nnoremap <Leader>Al :left<CR>
nnoremap <Leader>Ac :center<CR>
nnoremap <Leader>Ar :right<CR>
vnoremap <Leader>Al :left<CR>
vnoremap <Leader>Ac :center<CR>
vnoremap <Leader>Ar :right<CR>

"***********************************************************************************

" Plugin specific keybinds

"***********************************************************************************
 
" COC Keybinds
" Remap keys for gotos
map <leader>cd <Plug>(coc-definition)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>ci <Plug>(coc-implementation)
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
nnoremap  <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <Leader>co  :<C-u>CocList outline<cr>
" Completion keybinds

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" shift+tab cycles backwards 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enter to confirm completion
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Git keybinds
" Git status
nnoremap  <Leader>gs  :Gstatus<cr>
" Git diff in split window
nnoremap  <Leader>gd  :Gdiffsplit<cr>
" Git commit
nnoremap  <Leader>gc  :Gcommit<cr>
" Git push 
nnoremap  <Leader>gP  :Gpush<cr>
" Git pull 
nnoremap  <Leader>gp  :Gpull<cr>
" Git move 
nnoremap  <Leader>gm  :Gmove<cr>
" Git merge 
nnoremap  <Leader>gM  :Gmerge<cr>
" browse current file on web
nnoremap  <Leader>gb  :Gbrowse<cr>
" browse current line on web
nnoremap  <Leader>gbl  :CocCommand git.browserOpen<cr>
" View chunk information in preview window. 
nnoremap  <Leader>gh  :CocCommand git.chunkInfo<cr>
" View commit information in preview window. 
nnoremap  <Leader>gsc  :CocCommand git.showCommit<cr>
" Toggle git gutter sign columns
nnoremap  <Leader>gg  :CocCommand git.toggleGutters<cr>
" Lazygit
nnoremap <silent> <Leader>lg :call ToggleLazyGit()<CR>


" NERD Commenter
" Toggle comments in visual or normal mode
nnoremap <leader>nn :call NERDComment(0,"toggle")<cr>
vnoremap <leader>nn :call NERDComment(1,"toggle")<cr>
" Toggle a sexy comment
nnoremap <leader>ns :call NERDComment(0,"sexy")<cr>
vnoremap <leader>ns :call NERDComment(1,"sexy")<cr>
" append a  comment
nnoremap <leader>na :call NERDComment(0,"append")<cr>
vnoremap <leader>na :call NERDComment(1,"append")<cr>
" uncomment section
nnoremap <leader>nu :call NERDComment(0,"uncomment")<cr>
vnoremap <leader>nu :call NERDComment(1,"uncomment")<cr>
" invert comments
nnoremap <leader>ni :call NERDComment(0,"invert")<cr>
vnoremap <leader>ni :call NERDComment(1,"invert")<cr>
" comment section
nnoremap <leader>nc :call NERDComment(0,"comment")<cr>
vnoremap <leader>nc :call NERDComment(1,"comment")<cr>
"

" Startify
nnoremap <Leader>ss :Startify<CR>

" Vista
" Floating tag finder
nnoremap  <Leader>ff  :Vista finder coc<cr>
" Opens tagbar on right side of screen
nmap <F8> :Vista!!<CR>


" Lazydocker
nnoremap <silent> <Leader>ld :call ToggleLazyDocker()<CR>

" vim-translator
" Echo translation in the cmdline
nmap <silent> <Leader>tt <Plug>Translate
vmap <silent> <Leader>tt <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV


" Vimtex
nmap <silent> <Leader>lTc :VimtexCompile<cr>
vmap <silent> <Leader>lTs :VimtexCompileSelected<cr>
nmap <silent> <Leader>lTi :VimtexInfo<cr>
nmap <silent> <Leader>lTt :VimtexTocToggle<cr>
nmap <silent> <Leader>lTv :VimtexView<cr>


" Markdown preview
nmap <Leader>md <Plug>MarkdownPreviewToggle

"***********************************************************************************

" Orion Keybinds

"***********************************************************************************

" File Actions
nnoremap <silent> <Leader>w :w!<CR>

" PROS Keymap
nnoremap <silent> <Leader>pp :!pmc<CR>
nnoremap <silent> <Leader>pu :!pmu<CR> 
nnoremap <silent> <Leader>2pu :!pmu 2<CR> 
nnoremap <silent> <Leader>3pu :!pmu 3<CR> 
nnoremap <silent> <Leader>4pu :!pmu 4<CR> 

" Editor Keybinds
nnoremap <silent> <Leader>Q :q<CR>
nnoremap<silent> <Space>q :bdelete<CR> 

" Scratch Term Gang
nnoremap <silent> <Leader>lt :call ToggleScratchTerm()<CR>

" VimWiki Remaps
:nmap <Leader>en <Plug>VimwikiNextLink
let g:vimwiki_map_prefix = '<Leader>e'

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Jupyter NB Binds
" nmap <silent> <leader>jqt :RunQtConsole<Enter>
" nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
" nmap <silent> <leader>jc <Plug>(IPy-RunCell)
" nmap <silent> <leader>ja <Plug>(IPy-RunAll)
