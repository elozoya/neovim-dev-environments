func! s:installCocExtension(extension)
    if index(g:coc_global_extensions, a:extension) == -1
        call add(g:coc_global_extensions, a:extension)
    endif
endfunc

" plugs
call s:installCocExtension("coc-phpls")
call s:installCocExtension("coc-html")
call s:installCocExtension("coc-css")
call s:installCocExtension("coc-tsserver")
call s:installCocExtension("coc-blade")
call s:installCocExtension("coc-vetur")
call s:installCocExtension("coc-yaml")
