" Install plug 
" curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" gem install solargraph

call plug#begin()
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/vimux'
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
"autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab nowrap formatoptions-=t


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

function! CommentBlock()
    execute "s/^/#/g"
endfunction

function! UnCommentBlock()
    execute "s/^#//g"
endfunction

vnoremap <leader># :call CommentBlock()<CR>
vnoremap <leader>## :call UnCommentBlock()<CR>



let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rvm/gems/ruby-2.7.2/bin/solargraph', 'stdio'],
    \ }

