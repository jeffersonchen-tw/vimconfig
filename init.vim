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

set colorcolumn=80

call plug#begin()
if exists('g:vscode')
	" VSCode extension
  "Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'wellle/targets.vim'
  Plug 'hauleth/sad.vim'
  Plug 'q9w/hop.vim'
  Plug 'bfredl/nvim-miniyank'
else
	" ordinary neovim
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
  Plug 'prettier/vim-prettier'
  Plug 'rafamadriz/neon'
  Plug 'airblade/vim-gitgutter'
  Plug 'Pocco81/NoCLC.nvim'
  Plug 'romainl/vim-cool'
  Plug 'Pocco81/HighStr.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'j5shi/CommandlineComplete.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-commentary'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify'
  Plug 'kshenoy/vim-signature'
  Plug 'alvan/vim-closetag'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'bfredl/nvim-miniyank'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'q9w/hop.vim'
  Plug 'hauleth/sad.vim'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'keith/swift.vim'
endif
call plug#end()

let g:coc_global_extensions = [
			\ "coc-highlight",
			\ "coc-explorer",
			\ "coc-lists",
			\ "coc-vimlsp",
			\ "coc-pyright",
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


"startify
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
nnoremap <C-r> :MundoToggle<cr>
let g:mundo_width = 40


" Explorer"
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
syntax on


autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta


map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:move_key_modifier = 'C'

" " status line
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

cmap <C-p> <Plug>CmdlineCompleteBackward
cmap <C-n> <Plug>CmdlineCompleteForward


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

"if exists("g:vscode")
"	"easymotion
"	let g:EasyMotion_do_mapping = 0 
"	map <Leader>L <Plug>(easymotion-bd-jk)
"	nmap <Leader>L <Plug>(easymotion-overwin-line)
"	map  <Leader>w <Plug>(easymotion-bd-w)
"	nmap <Leader>w <Plug>(easymotion-overwin-w)
"	map  / <Plug>(easymotion-sn)
"	"sneak
"	let g:sneak#label = 1
"	let g:sneak#use_ic_scs = 1
"	" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
"	let g:sneak#s_next = 1
"	let g:sneak#prompt = '🔎'
"	map f <Plug>Sneak_f
"	map F <Plug>Sneak_F
"	map t <Plug>Sneak_t
"	map T <Plug>Sneak_T
"	map <space>w <CMD>HopWord<CR>
"else
"endif

" hop
map ? <CMD>HopPattern<CR>
map <space>w <CMD>HopWord<CR>
map <space>l <CMD>HopLine<CR>
map f <CMD>HopChar1<CR>
map F <CMD>HopChar2<CR>

" Normal mode
nmap <space>s <Plug>(sad-change-forward)
nmap <space>S <Plug>(sad-change-backward)


" visual multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'       
let g:VM_maps['Find Subword Under'] = '<C-n>'

if exists('d:vscode')
		" VSCode extension
	nnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
else
lua << EOF
require'lualine'.setup {options = {lower = true, theme = 'neon'}}

vim.o.termguicolors = true
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_italic_comment = true

vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')

vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')

vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

vim.api.nvim_command('highlight default HopUnmatched guifg=#666666 ctermfg=242')

EOF
colorscheme neon
endif

let g:floaterm_width=0.8
let g:floaterm_height=0.7
let g:floaterm_autoclose=2
let g:floaterm_keymap_new = '<space>t'
let g:floaterm_opener = 'vsplit'
hi FloatermBorder guibg=skyblue guifg=Black

"python path
let g:python3_host_prog = '/opt/homebrew/Caskroom/miniforge/base/bin/python'


map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

nmap <space>aj <Plug>(AerojumpSpace)
