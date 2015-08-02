augroup filetype
    au! BufRead,BufNewFile *.f95,*.f90,*.for,*.f,*.F,*.inc,*.fpp set filetype=fortran
    au BufRead,BufNewFile *.md set filetype=markdown
augroup END
