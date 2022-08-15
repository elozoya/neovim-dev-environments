" installing coc extensions using the global variable g:coc_global_extensions
if !exists("g:coc_global_extensions")
  let g:coc_global_extensions = []
endif

" plugs
if index(g:coc_global_extensions, "coc-go") == -1
    call add(g:coc_global_extensions, "coc-go")
endif
