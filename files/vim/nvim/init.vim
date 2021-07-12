" Install plug 
" curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim  --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" gem install solargraph

let g:loaded_python_provider=0

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    let g:mac=1
  endif
endif

if exists("g:mac")

	call plug#begin()
    Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
    Plug 'junegunn/fzf'
    Plug 'vim-ruby/vim-ruby'
    Plug 'SidOfc/mkdx'
	call plug#end()

else

  let g:python3_host_prog = '/usr/bin/python3'

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

endif
let g:dracula_colorterm = 1
colorscheme dracula






" Turn on syntax highlighting
syntax on

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set wrap
set textwidth=79
"set formatoptions=tcqrn1
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
if !exists("g:mac")
  autocmd BufEnter * call ncm2#enable_for_buffer()
endif
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





let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }


let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rvm/gems/ruby-2.7.2/bin/solargraph', 'stdio'],
    \ }


" https://vim.fandom.com/wiki/Display_output_of_shell_commands_in_new_window
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize '
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)


" this allows me to execute bash functions from vim with !
set shell=bash\ --login

" set file type to shell 
" look at the filetype with :filetype?
autocmd BufNewFile,BufRead *.source set filetype=sh

" setup comment char
autocmd FileType ruby,python,sh 
                                \ let g:comment_char="#" |
                                \ setlocal nowrap |  " do not automatically wrap on load
                                \ set formatoptions=cqrn1 " do not automatically wrap text when typing
                                
"autocmd FileType vim let g:comment_char="""
vnoremap <leader># :call comment#Add()<CR>
vnoremap <leader>## :call comment#Remove()<CR>
