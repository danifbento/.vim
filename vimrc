set nocompatible
set autoindent
syntax on
colorscheme desert
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab


" Use .as for ActionScript files, not Atlas files.
au Bufread,BufNewFile *.as set filetype=actionscript
au Syntax as runtime! ~/.vim/syntax/actionscript.vim

" Put these in a autocmd group, so that we can delete them easily.
augroup vimrc
au!
autocmd FileType actionscript setlocal sw=4 sts=4 et
autocmd FileType actionscript set omnifunc=actionscriptcomplete#CompleteAS
autocmd FileType actionscript :set dictionary=~/.vim/dict/actionscript.dict
autocmd FileType python	      setlocal sw=4 sts=4 et tw=72
autocmd FileType ruby	      setlocal sw=2 sts=2 et
augroup END

set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu


noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
map <C-j> :lnext<CR>
map <C-k> :lprevious<CR>

set undofile
set undolevels=50
set undoreload=50

:set number "show line numbers
"filetype plugin on

autocmd BufNewFile *.as so ~/.vim/template/as_header.txt
autocmd BufNewFile *.as exe "1," . 10 . "g/@file:.*/s//@file: " .expand("%")
autocmd BufNewFile *.as exe "1," . 10 . "g/@date:.*/s//@date: " .strftime("%d-%m-%Y")
autocmd BufwritePre,FileWritePre *.as execute "normal ma"
autocmd BufwritePre,FileWritePre *.as exe "1," . 10 . "g/@lastmodified:.*/s/@lastmodified:.*/@lastmodified: " .strftime("%c")
autocmd BufWritePost,FileWritePost *.as execute "normal `a"

autocmd BufNewFile *.c,*.h so ~/.vim/template/c_header.txt
autocmd BufNewFile *.py so ~/.vim/template/py_header.txt
autocmd BufNewFile *.c,*.h,*.py exe "1," . 10 . "g/@file:.*/s//@file: " .expand("%")
autocmd BufNewFile *.c,*.h,*.py exe "1," . 10 . "g/@date:.*/s//@date: " .strftime("%d-%m-%Y")
autocmd BufwritePre,FileWritePre *.c,*.h,*.py execute "normal ma"
autocmd BufwritePre,FileWritePre *.c,*.h,*.py exe "1," . 10 . "g/@lastmodified:.*/s/@lastmodified:.*/@lastmodified: " .strftime("%c")
autocmd BufWritePost,FileWritePost *.c,*.h,*.py execute "normal `a"

