set hlsearch
set incsearch

" syntax highlighting
syntax on

" backspacing over autoindent, line breaks and start of insert (windows behaviour)
set backspace=indent,eol,start

" backspace in normal mode
nnoremap <BS> x

" tab width = 4 spaces
set tabstop=4

" indent width = 4
set shiftwidth=4

"indent rounded to next full shift width
set shiftround

" expand tabs to spaces
set expandtab

"auto-indent code blocks
"set autoindent

" always enable status line
set laststatus=2

" change status line color based on mode
"if version >= 700
"   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl 
"       "gui=Magenta
"   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 
"      "gui=bold,reverse
"endif

"show line numbers
set number

"show row and column
set ruler

"remaps ; to : for easier commands
nnoremap ; :

"source ~/.vim/basic-dark.vim
"source ~/.vim/PaperColor.vim

" basic-dark settings


" PaperColor settings
"set t_Co=256
"set background=dark
"colorscheme PaperColor


" gruvbox settings
set background=dark
let g:gruvbox_contrast_light="hard"
"let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox

" save temp files in one place
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Enable mouse, e.g move cursor with left click elect with right click.
"set mouse=a

"Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move cursor between windows with C-arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
imap <silent> <A-Up> <C-o><C-W><C-k>
imap <silent> <A-Down> <C-o><C-W><C-j>
imap <silent> <A-Left> <C-o><C-W><C-h>
imap <silent> <A-Right> <C-o><C-W><C-l>

" Move windows with A-arrow
nmap <silent> <C-A-Up> :wincmd K<CR>
nmap <silent> <C-A-Down> :wincmd J<CR>
nmap <silent> <C-A-Left> :wincmd H<CR>
nmap <silent> <C-A-Right> :wincmd L<CR>
"imap <silent> <C-A-Up> <C-o><C-W><C-k>
"imap <silent> <C-A-Down> <C-o><C-W><C-j>
"imap <silent> <C-A-Left> <C-o><C-W><C-h>
"imap <silent> <C-A-Right> <C-o><C-W><C-l>


