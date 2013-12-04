set nocompatible
set autoindent
syntax on
colorscheme desert
set tabstop=4
set shiftwidth=4
set softtabstop=4
set modeline

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

if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
endif
set backupdir -=.
set backupdir +=.
set backupdir -=~/
set backupdir ^=~/.vim/backup
set backupdir ^=./.vim-backup/
set backup

if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

:set number "show line numbers
"filetype plugin on

autocmd BufNewFile *.as so ~/.vim/template/as_header.txt
autocmd BufNewFile *.as exe "1," . 10 . "g/@file:.*/s//@file: " .expand("%")
autocmd BufNewFile *.as exe "1," . 10 . "g/@date:.*/s//@date: " .strftime("%d-%m-%Y")
autocmd BufwritePre,FileWritePre *.as execute "normal ma"
autocmd BufwritePre,FileWritePre *.as exe "1," . 10 . "g/@lastmodified:.*/s/@lastmodified:.*/@lastmodified: " .strftime("%c")
autocmd BufWritePost,FileWritePost *.as execute "normal `a"

"autocmd BufNewFile *.c,*.h so ~/.vim/template/c_header.txt

autocmd BufNewFile *.py so ~/.vim/template/pyheader.txt
autocmd BufNewFile *.sh so ~/.vim/template/shheader.txt

"autocmd BufNewFile *.c,*.h,*.py exe "1," . 10 . "g/@file:.*/s//@file: " .expand("%")
"autocmd BufNewFile *.c,*.h,*.py exe "1," . 10 . "g/@date:.*/s//@date: " .strftime("%d-%m-%Y")
"autocmd BufwritePre,FileWritePre *.c,*.h,*.py execute "normal ma"
"autocmd BufwritePre,FileWritePre *.c,*.h,*.py exe "1," . 10 . "g/@lastmodified:.*/s/@lastmodified:.*/@lastmodified: " .strftime("%c")
"autocmd BufWritePost,FileWritePost *.c,*.h,*.py execute "normal `a"

