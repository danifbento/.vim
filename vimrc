set autoindent
syntax on
filetype plugin on

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

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

map <C-j> :lnext<CR>
map <C-k> :lprevious<CR>

set undodir=~/.vim/undodir
set undofile
set undolevels=50
set undoreload=50


