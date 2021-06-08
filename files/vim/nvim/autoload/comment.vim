function! comment#Add()
    if exists("g:comment_char")
      execute "s/^/" . g:comment_char . "/g"
    endif
endfunction

function! comment#Remove()
    if exists("g:comment_char")
      execute "s/^" . g:comment_char . "//g"
    endif
endfunction
