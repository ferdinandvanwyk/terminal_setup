"" Add graphicx to the detected packages (such that EFI uses 
\includegraphics)
if !exists("g:Tex_package_detected")
    let g:Tex_package_detected = 'graphicx'
elseif g:Tex_package_detected !~ '\<graphicx\>'
    let g:Tex_package_detected = g:Tex_package_detected.',graphicx'
endif
