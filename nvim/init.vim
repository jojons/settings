set hlsearch
set incsearch

" hide info header in file listing
"let g:netrw_banner=0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
"autocmd FileType netrw setl bufhidden=delete

" space clears highlighted occurence (triggered with *)
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Add status bar at bottom
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" syntax highlighting
syntax on

" hl for docker
source $HOME/.config/nvim/dockerfile.vim

" hl for yaml
au BufNewFile,BufRead *.yaml,*.yml so ~/.config/nvim/yaml.vim

" backspacing over autoindent, line breaks and start of insert (windows behaviour)
set backspace=indent,eol,start

" backspace in normal mode
nnoremap <BS> x

" Map Ctrl-Backspace to delete previous word
"inoremap <C-w> <C-\><C-o>dB
"inoremap <C-BS> <C-\><C-o>db

" tab width = 4 spaces
set tabstop=4

" indent width = 4
set shiftwidth=4

"indent rounded to next full shift width
set shiftround

" expand tabs to spaces
set expandtab

set smarttab

"auto-indent code blocks
"set autoindent

" always enable status line
set laststatus=2

" get rid of "-- INSERT --" since it is shown by lightline instead
set noshowmode

" change status line color based on mode
"if version >= 700
"   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl
"       "gui=Magenta
"   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2
"      "gui=bold,reverse
"endif

"PWD follows the open file
set autochdir

"show line numbers
set number

"show row and column
set ruler

"remaps ; to : for easier commands
nnoremap ; :

" Call the theme one
colorscheme jlc

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors

" save temp files in one place
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Enable mouse, e.g move cursor with left click elect with right click.
"set mouse=a

"Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" Move line up or down
inoremap <silent> <A-Up> <Esc>:m-2<CR>==gi
inoremap <silent> <A-Down> <Esc>:m+<CR>==gi
vnoremap <silent> <A-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <A-Down> :m '>+1<CR>gv=gv
"nnoremap <silent> <A-j> :m .+1<CR>==
"nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" Move cursor between windows with C-arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"imap <silent> <A-Up> <C-o><C-W><C-k>
"imap <silent> <A-Down> <C-o><C-W><C-j>
"imap <silent> <A-Left> <C-o><C-W><C-h>
"imap <silent> <A-Right> <C-o><C-W><C-l>

" Move windows with A-arrow
nmap <silent> <C-A-Up> :wincmd K<CR>
nmap <silent> <C-A-Down> :wincmd J<CR>
nmap <silent> <C-A-Left> :wincmd H<CR>
nmap <silent> <C-A-Right> :wincmd L<CR>
"imap <silent> <C-A-Up> <C-o><C-W><C-k>
"imap <silent> <C-A-Down> <C-o><C-W><C-j>
"imap <silent> <C-A-Left> <C-o><C-W><C-h>
"imap <silent> <C-A-Right> <C-o><C-W><C-l>


let &tags=$CTAGS_DB

source $HOME/.config/nvim/plug.vim

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'itchyny/lightline.vim'

"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ }


let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND = 'find $HOME'

Plug 'tpope/vim-vinegar'

Plug 'airblade/vim-gitgutter'

Plug 'bronson/vim-trailing-whitespace'

Plug 'tpope/vim-sensible'

call plug#end()

