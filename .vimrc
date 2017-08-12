set nocompatible              "We want the latest vim settings/options
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME


so ~/.vim/plugins.vim

syntax enable
let mapleader = ','      "The default leader is \, but a comma is much better.
set number               "Let's activate line numbers.
set relativenumber
set tabstop=2 shiftwidth=2 expandtab
set autochdir
set clipboard=unnamed    "Set yank to clipboard"
" be iMproved, required

"------------Visuals------------------"
colorscheme gruvbox
set background=dark
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_left_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
endif
set guifont=Fira_Code:h15
"set linespace=15         "MacVim specific lineheight.
set macligatures         "We want pretty symbols when available.
hi LineNr guibg= NONE 
hi vertsplit guifg=bg guibg=bg   
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


"------------Search------------------"
set hlsearch
set incsearch





"------------Split Management------------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>	
	
	
	
	
"------------Mappings------------------"
"Make it easy to edit the Vimrc file"
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <D-\> :NERDTreeToggle<cr>

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
"CTag find
nmap <leader>f :tag<space>
"CTag CtrlP
nmap <leader>. :CtrlPTag<cr>



"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'order:ttb,min:1,max:30,results:30'
"let g:ctrlp_working_path_mode = 'w'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Greplace.vim
"/
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

"/
"/ typescript-vim
"/
"/
"/ vim-js-pretty-template
"/
"/
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
"/ html5.vim
"/
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0



"------------Auto-Commands------------------"

"Automatically source the Vimrc file on save."

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


"------------Tips&Tricks------------------"
" - Press ctrl + ^ to instantly go to function definition

