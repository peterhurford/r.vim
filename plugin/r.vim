" r.vim
" Author: Peter Hurford
" Version: 1.0
" Will let you run R tests from within vim.

nnoremap <Leader>tt :call RunFileTest()<CR>
nnoremap <Leader>TT :call RunAllTest()<CR>

function! RunFileTest()
  let file_name = expand('%:r')
  "echo "'.', '" . file_name . "'"
  call RunTest("'.', '" . file_name . "'")<CR>
endfunction

function! RunAllTest()
  let pkg_dir = expand("%:p:h:h")
  "echo "'" . pkg_dir . "'"
  call RunTest("'" . pkg_dir . "'")<CR>
endfunction

function! RunTest(args)
  let args = a:args
  let command = "! Rscript -e \"library(methods); library(devtools); test(" . args . ")\""
  echo "Running tests... Please wait..."
  echo system(command)
endfunction
