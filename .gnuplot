if ((GPVAL_VERSION < 4.5) \
        ||  (!strstrt(GPVAL_COMPILE_OPTIONS,"+USER_LINETYPES"))) \
           exit               
       set linetype 1 lc rgb '#0072bd'      lw 2 pt 0                           
       set linetype 2 lc rgb '#d95319'      lw 2 pt 7                           
       set linetype 3 lc rgb '#edb120'      lw 2 pt 6 pi -1                     
       set linetype 4 lc rgb '#7e2f8e'      lw 2 pt 5 pi -1                     
       set linetype 5 lc rgb '#77ac30       lw 2 pt 8                           
       set linetype 6 lc rgb '#4dbeee'      lw 2 pt 3                           
       set linetype 7 lc rgb '#a2142f'      lw 2 pt 11                          
       set linetype cycle 7
