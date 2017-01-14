autocmd bufnewfile *.c call MakeHeaderComment('/*',',',',','*/')
autocmd bufnewfile *.cpp call MakeHeaderComment('/*',',',',','*/')


" bc=begin comment, cc=continue comment, ec=end comment
function! MakeHeaderComment(bc,cc,ec)
 "set paste
 let s:author = ""
 let s:license = ""

 if exists('g:commenter_author')
   let s:author = g:commenter_author
 end

 let s:print_header_comment = a:bc . "######################################" . "\r"
 let s:print_header_comment = a:cc . "License: " . s:license . "\r"
 let s:print_header_comment = a:cc . "File: " . expand(%:t) . "\r"
 let s:print_header_comment = a:cc . "Author: " . s:author . "\r"
 let s:print_header_comment = a:cc . "Created: " . strftime("%d-%m-%Y") . "\r"
 let s:print_header_comment = a:ec . "######################################" . "\r"

 exec "normal i" . s:print_header_comment

 "set nopaste
end function
