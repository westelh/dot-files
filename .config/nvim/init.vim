set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ambiwidth=double

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
Plug 'bronson/vim-trailing-whitespace'
Plug 'ericbn/vim-solarized'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let s:plugin_config = '~/.config/nvim/plugged/'
source `=s:plugin_config . 'vim-solarized.vim'`
source `=s:plugin_config . 'vim-airline.vim'`
source `=s:plugin_config . 'nerdtree.vim'`
source `=s:plugin_config . 'vim-trailing-whitespace.vim'`
source `=s:plugin_config . 'copilot.vim'`

nnoremap <C-n> :NERDTreeToggle<CR>

