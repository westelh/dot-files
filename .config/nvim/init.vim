set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set number

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

