if exists('g:vscode')
	" VSCode extension
	nnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
endif


set hidden
syntax on

set autoread
filetype on
filetype indent on
filetype plugin on
set smartindent
set copyindent

set wildmenu

set cursorline
set cursorcolumn

set tabstop=4 softtabstop=4 shiftwidth=4
set scrolloff=1
set clipboard=unnamed

set hlsearch
set ignorecase
set incsearch
set magic
set smartcase

set splitbelow
set splitright

set ai
set nowrap
set number
set showmatch

set mouse=a
set so=999

set showmode
set laststatus=2 ruler

set nocompatible

set updatetime=300
" open new splitpanes to right and below
set splitright
set splitbelow

set noswapfile
set nobackup
set history=50
set nowrapscan
set nowritebackup

set signcolumn=yes
set shortmess+=c

call plug#begin()
if exists('g:vscode')
	" VSCode extension
  Plug 'justinmk/vim-sneak'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'wellle/targets.vim'
  Plug 'machakann/vim-sandwich'
else
	" ordinary neovim
  Plug 'wellle/targets.vim'
  Plug 'j5shi/CommandlineComplete.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'justinmk/vim-sneak'
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-commentary'
  Plug 'machakann/vim-sandwich'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify'
  Plug 'kshenoy/vim-signature'
  Plug 'alvan/vim-closetag'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'vim-airline/vim-airline'
endif
call plug#end()


let g:coc_global_extensions = [
			\ "coc-highlight",
			\ "coc-explorer",
			\ "coc-lists",
			\ "coc-vimlsp",
			\ "coc-python",
			\ "coc-tasks",
			\ "coc-yank",
			\ "coc-json",
			\ "coc-vimtex",
			\ "coc-html",
			\ "coc-tsserver",
			\ "coc-clangd",
			\ "coc-prettier",
			\ "coc-sourcekit",
			\ "coc-css"]

inoremap <silent><expr> <C-N> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"



" move among buffers
map <C-b> :bnext<CR>



let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
let g:sneak#prompt = '🔎'
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_f
map T <Plug>Sneak_F


""startify
let g:startify_lists = [
			\ { 'type': 'files',     'header': ['   Files']            },
			\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ ]
let g:startify_bookmarks = [
			\ { 'i': '~/.config/nvim/init.vim' },
			\ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_enable_special = 0
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = [
\ '  __     __                              ',
\ '  \ \   / / (_)_ __ ___                     ',
\ '   \ \ / /  | | ''_ ` _ \  WELCOME!         ',
\ '    \ V /   | | | | | | |     JEFFERSON CHEN',
\ '     \_/    |_|_| |_| |_|                   ',
\ '',
\ '',
\ ]
nnoremap <f6> :Startify<cr>



"mundo
nnoremap <C-u> :MundoToggle<cr>
let g:mundo_width = 60


" Explorer"
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
syntax on

" For dark version.
colorscheme onedark

autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta


map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:move_key_modifier = 'C'

let g:airline#extensions#tabline#enabled = 1

cmap <C-p> <Plug>CmdlineCompleteBackward
cmap <C-n> <Plug>CmdlineCompleteForward
