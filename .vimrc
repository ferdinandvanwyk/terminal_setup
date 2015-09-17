set tabstop=4     
set expandtab     
set shiftwidth=4  
set autoindent    
set cindent   
set colorcolumn=80

let fortran_free_source=1
let fortran_fold=1

:filetype on
:filetype indent on
:filetype plugin on

set foldmethod=syntax
syntax enable

set wildmode=longest,list

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
   else
      return "\<Tab>"
   endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

set backup
set backupdir=~/.vim_backup

"Pathogen
execute pathogen#infect()

"Airline customization
let g:airline#extensions#tabline#enabled = 1                                    
set laststatus=2                                                                
let g:airline_theme = 'solarized'
let g:syntastic_fortran_compiler_options = "-fdefault-real-8 -ffree-form -ffree-line-length-none"
let g:syntastic_python_python_exec = '/local/home/vanwyk/py_envs/py3/bin/python'

"Solarized
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

"LaTeX                                                                          
let g:tex_flavor='latex'                                                        
set grepprg=grep\ -nH\ $*

"Customized indentation for different languages
au FileType ruby setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
au BufRead,BufNewFile *.rst setl sw=3 sts=3 et
au BufRead,BufNewFile *.f?? setl sw=3 sts=3 et
au BufRead,BufNewFile *.tex setl sw=2 sts=2 et
au BufRead,BufNewFile *.html setl sw=2 sts=2 et

"No yanking of old text after pasting
vnoremap p "_dP

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
