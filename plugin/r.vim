" r.vim
" Author: Peter Hurford
" Version: 1.0
" Will let you run R tests from within vim.

nnoremap <Leader>tt :call RunFileTest()<CR>
nnoremap <Leader>TT :call RunAllTest()<CR>

function! RunFileTest()
  let file_name = expand('%:r')
  if file_name =~ "tests"
    let file_name = split(expand('%:t:r'), '-')[1]
  endif
  call RunTest("'.', '" . file_name . "'")<CR>
endfunction

function! RunAllTest()
  let pkg_dir = expand("%:p:h:h")
  call RunTest("'" . pkg_dir . "'")<CR>
endfunction

function! RunTest(args)
  let args = a:args
  let command = "! Rscript -e \"library(methods); library(devtools); test(" . args . ")\""
  echo "Running tests: " . args . " ... Please wait..."
  echo system(command)
endfunction
