" General
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cindent
set colorcolumn=80
set backspace=indent,eol,start
set so=999 "Keeps cursor near middle of screen
set cino=N-s
set cinoptions+=g2
set cinoptions+=h2
set term=xterm-256color
set splitright

let fortran_free_source=1
let fortran_fold=1

:filetype on
:filetype indent on
:filetype plugin on

set foldmethod=syntax
syntax enable

set wildmode=longest,list

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Custom shortcuts
:command Sd SyntasticToggleMode
:command Sc SyntasticCheck
:command Sp setlocal spell spelllang=en_gb
:nnoremap <F2> $A #<Esc>YpVkr#p
:map <F7> <Esc>:w <Return>
:map! <F7> <Esc>:w <Return>
:map <F8> <Esc>:w <Return><C-z>
:map! <F8> <Esc>:w <Return><C-z>
:map <F9> <Esc>:wq <Return>
:map! <F9> <Esc>:wq <Return>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Autocomplete
function! Tab_Or_Complete()
   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
   else
      return "\<Tab>"
   endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

set backup
set backupdir=~/.vim_backup

"Pathogen
execute pathogen#infect()

" Airline customization
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme = 'solarized'
let g:riv_fold_auto_update = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_fortran_compiler_options = "-fdefault-real-8 -ffree-form -ffree-line-length-none"
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_tex_chktex_args = "-n24 -n8 -n1 -1"
let g:syntastic_html_tidy_ignore_errors=["'<' + '/' + letter not allowed here"]
let g:syntastic_java_javac_classpath = ".:/Users/vanwyk/java_jars/*.jar"
let g:syntastic_java_checkers=['javac', 'checkstyle']
let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options=" -std=c++14"
let g:syntastic_cpp_checkers = ['clang_tidy', 'gcc']
let g:syntastic_cpp_clang_tidy_args = '-checks=* -std=c++14'

" NERDTree
map <C-n> :NERDTreeToggle<CR> " toggle
autocmd vimenter * NERDTree | wincmd p " auto start, return focus to file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " auto quit when closing file

" Vim Latex
let g:Tex_PromptedCommands=''
let g:Tex_FoldedEnvironments="verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,multline,inparaenum,quote"
let g:Tex_Env_table ="\\begin{table}\<cr>\\centering\<cr>\\caption{<+Caption text+>}\<cr>\\begin{tabular}{<+dimensions+>}\<cr>\\toprule\<cr><+headings+>\<cr>\\midrule\<cr><+data+>\<cr>\\bottomrule\<cr>\\end{tabular}\<cr>\\label{tab:<+label+>}\<cr>\\end{table}<++>"

"Solarized
syntax enable
if strftime("%H") < 18 && strftime("%H") > 7
    set background=light
else
    set background=dark
endif
let g:solarized_termcolors=16
colorscheme solarized

"LaTeX
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*

"Vim HTML
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Customized indentation for different languages
au FileType ruby setl sw=2 sts=2 et
au FileType java setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType cpp setl sw=4 sts=4 et
au BufRead,BufNewFile *.rst setl sw=3 sts=3 et
au BufRead,BufNewFile *.md setl sw=3 sts=3 et
au BufRead,BufNewFile *.f?? setl sw=3 sts=3 et
au BufRead,BufNewFile *.tex setl sw=2 sts=2 et
au BufRead,BufNewFile *.sty setl sw=2 sts=2 et
au BufRead,BufNewFile *.html setl sw=2 sts=2 et

"No yanking of old text after pasting
vnoremap p "_dP

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Disable auto commenting of next lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Delimitmate auto indentation
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" ctags shortcuts
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
