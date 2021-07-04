set hidden
syntax on

set termguicolors

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
  " Plug 'asvetliakov/vim-easymotion'
else
	" ordinary neovim
  " theme
  Plug 'rafamadriz/neon'
  Plug 'folke/tokyonight.nvim'
  " indent line
  Plug 'lukas-reineke/indent-blankline.nvim'
  "
  Plug 'folke/todo-comments.nvim'
  "
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nicwest/vim-camelsnek'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
  Plug 'prettier/vim-prettier'
  Plug 'Pocco81/NoCLC.nvim'
  Plug 'romainl/vim-cool'
  Plug 'Pocco81/HighStr.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'mg979/vim-visual-multi'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-commentary'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify'
  " mark
  Plug 'kshenoy/vim-signature'
  "
  Plug 'alvan/vim-closetag'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'bfredl/nvim-miniyank'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'junegunn/vim-easy-align'
  " motion
  Plug 'q9w/hop.vim'
  " Plug 'asvetliakov/vim-easymotion'
  "
  Plug 'hauleth/sad.vim'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'
  Plug 'keith/swift.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
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
			\ "coc-prettier",
			\ "coc-css"]

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

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


map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:move_key_modifier = 'C'


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


" Normal mode
nmap <space>s <Plug>(sad-change-forward)
nmap <space>S <Plug>(sad-change-backward)


" visual multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'       
let g:VM_maps['Find Subword Under'] = '<C-n>'

" hop
map ? <CMD>HopPattern<CR>
map <space>w <CMD>HopWord<CR>
map <space>l <CMD>HopLine<CR>
map f <CMD>HopChar1<CR>
map F <CMD>HopChar2<CR>

if exists('g:vscode')
		" VSCode extension
	nnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xnoremap <silent> <space> :call VSCodeNotify('whichkey.show')<CR>
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
	lua require('hop').setup({create_hl_autocmd = true})
	"easymotion
	" let g:EasyMotion_do_mapping = 0 
	" let g:EasyMotion_smartcase = 1
	" map <Leader>L <Plug>(easymotion-bd-jk)
	" nmap <Leader>L <Plug>(easymotion-overwin-line)
	" map  <Leader>w <Plug>(easymotion-bd-w)
	" nmap <Leader>w <Plug>(easymotion-overwin-w)
	" map  / <Plug>(easymotion-sn)
	" omap  / <Plug>(easymotion-tn)
	" map  f <Plug>(easymotion-bd-f)
	" nmap f <Plug>(easymotion-overwin-f)
	" map  n <Plug>(easymotion-next)
	" map  N <Plug>(easymotion-prev)
else
	lua << EOF
	require'lualine'.setup {options = {lower = true, theme = 'neon'}}

	require("bufferline").setup{}

	require('hop').setup({create_hl_autocmd = true})
	
	vim.g.neon_style = "default" 
	vim.g.neon_italic_keyword = true 
	vim.g.neon_italic_function = true 
	vim.g.neon_italic_comment = true 

	require'nvim-treesitter.configs'.setup {
	  highlight = {
		enable = true,
		custom_captures = {
		  -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
		  ["foo.bar"] = "Identifier",
		},
	  },
	}

	require'nvim-treesitter.configs'.setup {
	  indent = {
		enable = true
	  }
	}

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

