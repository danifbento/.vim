set autoindent
syntax on
colorscheme desert

" Use .as for ActionScript files, not Atlas files.
au Bufread,BufNewFile *.as set filetype=actionscript

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

set undodir=~/.vim/undodir
set undofile
set undolevels=50
set undoreload=50

:set number "show line numbers
"filetype plugin on
