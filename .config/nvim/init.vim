set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set number

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
Plug 'jiangmiao/auto-pairs'
Plug 'hashivim/vim-terraform'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

nnoremap <C-n> :NERDTreeFocus<CR>

