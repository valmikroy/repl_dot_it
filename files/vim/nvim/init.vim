" Install plug 
" curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



call plug#begin()
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
call plug#end()
colorscheme dracula


" Turn on syntax highlighting
syntax on

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Forget being compatible with good ol' vi
set nocompatible



" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on



""" Mappings

let mapleader=","


" NERD Tree bindings
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>nf :NERDTreeFocus<CR>


" Vim reload config
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>ec :vsplit ~/.config/nvim/init.vim<CR>


" paste toggle 
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" folds
set foldmethod=syntax
set foldnestmax=1
set nofoldenable
nmap <leader>ef :set foldenable<CR>
nmap <leader>df :set nofoldenable<CR>


" Ultisnips
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsRemoveSelectModeMappings = 0


fun! UltiSnipEditAndLoad()
  call UltiSnips#Edit(&filetype)
  call UltiSnips#RefreshSnippets()
endfun  

nmap <leader>uue :call UltiSnipEditAndLoad()<CR>


" copy paste
"set mouse=+a



" color
"colorscheme slate
"set cursorline
"highlight Pmenu guibg=white guifg=black gui=bold
"highlight Comment gui=bold
"highlight Normal gui=none
"highlight NonText guibg=none
"highlight Normal guibg=NONE ctermbg=NONE
"highlight LineNr guibg=NONE ctermbg=NONE
"highlight CursorLine ctermbg=DarkGray guibg=Grey10  cterm=none
"highlight NonText cterm=bold ctermfg=12 gui=bold guifg=#253f3f guibg=none
