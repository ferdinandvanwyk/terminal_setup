set tabstop=4     
set expandtab     
set shiftwidth=4  
set autoindent    
set smartindent   
set colorcolumn=80

set foldmethod=syntax
set syntax=on

:filetype on
:filetype indent on
:filetype plugin on

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
                                                                                
"Solarized                                                                      
set t_Co=16                                                                     
let g:solarized_termcolors=16                                                   
colorscheme solarized
