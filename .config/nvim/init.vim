set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ambiwidth=double
set termguicolors
syntax enable

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')
" Declare the list of plugins.
Plug 'github/copilot.vim'
Plug 'jjo/vim-cue'
Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'bronson/vim-trailing-whitespace'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Customize airline symbols for work-around of the issue
" https://github.com/vim-airline/vim-airline/issues/2704
let g:airline#extensions#whitespace#symbol = '!'

" set colorscheme
" solarized needs background to be set to dark or light
set background=dark
set notermguicolors
colorscheme solarized

nnoremap <C-n> :NERDTreeFocus<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Highlight extra whitespaces
" https://zenn.dev/kawarimidoll/articles/450a1c7754bde6
" u00A0 ' ' no-break space
" u2000 ' ' en quad
" u2001 ' ' em quad
" u2002 ' ' en space
" u2003 ' ' em space
" u2004 ' ' three-per em space
" u2005 ' ' four-per em space
" u2006 ' ' six-per em space
" u2007 ' ' figure space
" u2008 ' ' punctuation space
" u2009 ' ' thin space
" u200A ' ' hair space
" u200B '​' zero-width space
" u3000 '　' ideographic (zenkaku) space
autocmd VimEnter * ++once
      \ call matchadd('ExtraWhitespace', "[\u00A0\u2000-\u200B\u3000]")
      \ | highlight default ExtraWhitespace ctermbg=darkmagenta guibg=darkmagenta
