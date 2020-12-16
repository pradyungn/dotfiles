"  ____  _   _
" |  _ \| \ | | Pradyun Narkadamilli
" | |_) |  \| | https://pradyungn.tech
" |  __/| |\  | MIT License
" |_|   |_| \_| Copyright 2020 Pradyun Narkadamilli

" Plugin Settings
" Configuration for all the plugin stuffs


" Vim polyglot
let g:polyglot_disabled = ['latex']

" Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_grep=''

" VimTex
let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_method = "latexmk"
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Goyo
nmap <F6> :Goyo<CR>


" Vista
let g:vista_executive_for = {
      \ 'c': 'coc',
      \ 'cpp': 'coc',
      \ 'py': 'coc',
      \ 'dart': 'coc',
      \ 'rs': 'coc',
      \ 'js': 'coc',
      \ }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 50
let g:vista_close_on_jump = 1

"NerdTree
" if nerdtree is only window, kill nerdtree so buffer can die
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

" Airline
"main settings
let g:airline_theme='dracula'
let g:airline_symbols = {}
let g:airline_skip_empty_sections = 1

"extensions
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#unicode#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#hunks#enabled = 1

"extension settings
let g:airline#extensions#hunks#hunk_symbols = [':', ':', ':']
let g:airline#extensions#branch#format = 2
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'

"Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

"Indent Guides
let g:indentLine_char = '▏'

let g:indent_guides_auto_colors = 1
let g:indentLine_fileTypeExclude = [
      \'defx',
      \'markdown',
      \'denite',
      \'startify',
      \'tagbar',
      \'vista_kind',
      \'vista'
      \]

"Autopairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

"Startify

" Another vanity header
" use this if you want something that screams 'I'm better than you fucker'
" let s:header= [
    " \"    ___ ___      _ ___ ___       ",
    " \"   |  _|_  |    (_)  _|_  |      ",
    " \"   | |   | |_ __ _| |   | |_ __  ",
    " \"   | |   | | '__| | |   | | '_ \\ ",
    " \"   | |   | | |  | | |   | | | | |",
    " \"   | |_ _| |_|  |_| |_ _| |_| |_|",
    " \"   |___|___|      |___|___|      ",
    " \"",
    " \"   ------------------------------",
    " \"      Real Programmers Use NeoVim   ",
    " \"   ------------------------------"]

" Centers start screen vertically
function! s:vercent(head)
  let delt = ((&lines - len(a:head) - 15) / 2) - 1
  if delt<0
    return a:head
  endif
  let i = 0
  let head = a:head
  while i < delt
    let head = [''] + head
    let i = i + 1
  endwhile
  return head
endfunction

" Centers file entries horizontally. Hardcode offset, so long paths (over 50
" len) will break
function! s:horcent()
  let leng = 25 " delete this line if you figure out dynamic alignment"
  let delt = ((&columns - leng) / 2) - 1
  if delt<0
    return 0
  endif
  return delt
endfunction

let s:pad = <SID>horcent()

" Centers section header entries
function! s:bcent(str)
  let delt = ((&columns - len(a:str)) / 2) - 1
  if delt<0
    return a:str
  endif
  let i = 0
  let str = a:str
  while i < delt
    let str = " " . str
    let i = i + 1
  endwhile
  return str
endfunction

" opts
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0
let g:startify_padding_left = s:pad


" formatted header/footer
let s:footer= ['-------------------------------','  Real Programmers use Neovim  ','-------------------------------']
let g:exten = ["vim.orion - an endgame neovim config"]
let s:header = startify#center(startify#fortune#cowsay())
let g:startify_custom_header = <SID>vercent(s:header)
let g:startify_custom_footer = startify#center(s:footer) + startify#center(g:exten)

" intro sections
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': [<SID>bcent("bkmrk")]      },
          \ ]

" These are my bookmarks, use different ones on ur machine (unless you run my
" exact config?)
let g:startify_bookmarks = [
            \ {'r':'~/Documents/3304P'},
            \ {'bsp': '~/.config/bspwm' },
            \ {'sx': '~/.config/sxhkd' },
            \ {'n': '~/.config/nvim' },
            \ {'q': '~/.config/qutebrowser' }
            \ ]

" Put some cool commands here
" let g:startify_commands = [
        " \ ['Vim Reference', 'h ref'],
        " \ ]

" " colorgoup (Really shitty rn, change it to your liking)
" highlight StartifyBracket guifg=#bfbfbf
" highlight StartifyFooter  guifg=#50fa7b
" highlight StartifyHeader  guifg=#50fa7b
" highlight StartifyNumber  guifg=#ff79c6
" highlight StartifyPath    guifg=#f1fa8c
" highlight StartifySlash   guifg=#4d4d4d
" highlight StartifySection guifg=#bd93f9

"COC

" Define Error Symbols and colors
" Define Error Symbols and colors
hi CocWarningSign guifg=#ffb86c
hi CocErrorSign guifg=#ff5555

let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Extensions. Some need configuration.
" coc-java needs a valid JVM filepath defined in coc-settings
" coc-ccls needs ccls (available on aur)
" coc-eslint needs eslint npm package installed globally
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-flutter',
      \'coc-java',
      \'coc-ccls',
      \'coc-tabnine',
      \'coc-vimlsp',
      \'coc-go',
      \'coc-css',
      \'coc-sh',
      \'coc-snippets',
      \'coc-eslint',
      \'coc-emmet',
      \'coc-tsserver',
      \'coc-json',
      \'coc-highlight',
      \'coc-git',
      \'coc-utils',
      \'coc-rust-analyzer',
      \'coc-pairs',
      \'coc-prettier',
      \'coc-python',
      \'coc-vimtex',
      \]
      " \'coc-deno'

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


"Nerd Commenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Markdown Preview
" Contains CSS for markdown + page + higlight
let g:mkdp_markdown_css = '/home/pradyungn/.config/nvim/static/markdown-preview/customStyle.css'
" Trick plugin into hosting colors.css so we get nice themes
let g:mkdp_highlight_css = '/home/pradyungn/.config/nvim/static/highlight.css'
let g:mkdp_port = '3456'

" Let ripgrep find the index directory
if executable('rg')
    let g:rg_derive_root='true'
    let g:ctrlp_user_command = 'rg --files'
endif

" Ctrlp Settings
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" Keybind fixin
let NERDCreateDefaultMappings = 0
let g:vimwiki_map_prefix = '<Leader>j'
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'template_path': '~/vimwiki_templates/',
    \ 'template_default': 'default',
    \ 'template_ext': '.html',
    \ 'nested_syntaxes':{'python': 'python', 'c++': 'cpp', 'html':'html', 'css':'css', 'rust':'rust', 'js': 'javascript', 'json':'json', 'sql':'sql', 'c':'c', 'go':'go', 'yaml':'yaml', 'md':'markdown', 'ts':'typescript'}}]
let g:vimwiki_global_ext = 0

" LaTeX Live Reload
let g:livepreview_previewer = "zathura"
