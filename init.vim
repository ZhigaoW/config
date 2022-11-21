map S :w<CR>
map Q :q<CR>

au ColorScheme * hi Normal ctermbg=None " This line made the background color not looks gray

syntax on
set number
set relativenumber
" set cursorline
set showcmd
set ignorecase

" Formatting 
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
"set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them. // set this to 80~120 if required
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" 切换缓冲区 
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>


" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    "== 外观
        Plug 'vim-airline/vim-airline'
        Plug 'morhetz/gruvbox'
        Plug 'phanviet/vim-monokai-pro'
    "== 智能补全
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "== 标签
        Plug 'kshenoy/vim-signature'
    "== golang
        Plug 'fatih/vim-go', {'for':['go']}
    "== rust
        Plug 'rust-lang/rust.vim', {'for':['rst']}
    "== 光标
        Plug 'christoomey/vim-tmux-navigator'
    "== markdown
        Plug 'iamcco/markdown-preview.nvim'
    "== terminal
        Plug 'voldikss/vim-floaterm'
call plug#end()


" ===
" === begin [gruvbox]
" ===
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = '1'
" colorscheme gruvbox
"
" ===
" === end [gruvbox]
" ===


" ===
" === begin [monokai-pro]
" ===

set termguicolors
colorscheme monokai_pro
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }

" ===
" === end [monokai-pro]
" ===





" ===
" === begin [airline]
" ===
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline#extensions#tabline#formatter = 'default'

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " Theme ( github.com/vim-airline/vim-airline-themes
    let g:airline_theme= 'gruvbox'
" ===
" === end [airline]
" ===




" ===
" === begin [coc]
" ===


    let g:coc_global_extensions = [ 'coc-json', 'coc-vimlsp', 'coc-marketplace', 'coc-go', 'coc-explorer', 'coc-clangd', 'coc-rust-analyzer']

    set encoding=utf-8
    set nobackup
    set nowritebackup
    set updatetime=300
    set shortmess+=c


    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction



    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-o> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
    

    " 找上一个或者下一个报错
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)


    " GoTo code navigation.
    "   nmap <silent> gd <Plug>(coc-definition)
    "   nmap <silent> gy <Plug>(coc-type-definition)
    "   nmap <silent> gi <Plug>(coc-implementation)
    "   nmap <silent> gr <Plug>(coc-references)

    " Coc-explorer
    nmap <space>e <Cmd>CocCommand explorer<CR>

" ===
" === end [coc]
" ===


" ===
" === begin [markdown preview]
" ===


let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = ''


" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'


" ===
" === end [markdown preview]
" ===





" ===
" === begin [floaterm]
" ===

nnoremap <silent> <c-q> :FloatermToggle<CR>
tnoremap <silent> <c-q> <C-\><C-n>:FloatermToggle<CR>

" ===
" === end [floaterm]
" ===
