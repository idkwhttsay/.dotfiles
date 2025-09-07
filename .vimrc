"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
" Show dotfiles
let NERDTreeShowHidden=1

" Set colorsheme
set background=dark
colorscheme gruvbox

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='gruvbox'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/vim-gitgutter'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    " Allows seamless movement between Vim splits and tmux panes, which is useful when switching between code and terminal windows during contests
    Plug 'christoomey/vim-tmux-navigator'
    " A fast, command-line fuzzy finder that works as a backend for file searches and other quick navigation tasks.
    Plug 'junegunn/fzf.vim'
    " Brings IDE-like smart autocompletion, diagnostics, and language server support into Vim, which is especially helpful for programming under time pressure.
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " Simplifies the manipulation of surrounding characters (like quotes or brackets), enabling faster code editing.
    Plug 'tpope/vim-surround' 
    " Enhances syntax highlighting for a wide range of languages, ensuring that your code is displayed clearly during competitions.
    Plug 'sheerun/vim-polyglot'
    " Provides a fancy start screen for vim
    Plug 'mhinz/vim-startify'
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = '\'

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

noremap <Up> gk
noremap <Down> gj
" the following are optional, to move by file lines using Alt-arrows
noremap! <M-Up> <Up>
noremap! <M-Down> <Down>
noremap <M-Up> k
noremap <M-Down> j

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

function! OpenMainAndIn()
  " Open the main file in the current (left) window
  edit .out

  " Open the .in file in a vertical split to the right of main.cpp
  vsplit main.cpp
  wincmd l

  " In the right pane, perform a horizontal split to open the .out file
  split .In
  " Optional: Adjust window sizes as needed.
  " For example, move to the left window and set its width.
  vertical resize 30
  " Return to the right window if desired
  wincmd h
endfunction

" Map the function to F5 (feel free to choose another key if desired).
nnoremap <F5> :call OpenMainAndIn()<CR>

" Yank selected text into the system clipboard
vnoremap y "+y

" Paste text from the system clipboard
vnoremap p "+p

" Press F10 to compile the C++ file with g++ and accept input from the file
" named .in
noremap <F10> <ESC> :w <CR> :!sh run.sh<CR>
" inoremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -o "%<" "%" && "./%<" < .in<CR>

" Compile and run .cpp files
" nnoremap <F10> :w<CR>:!g++ -std=c++17 % -o %< && ./%<; echo "Press Enter to return to Vim"; read<CR>

" Enable backspace to work in all modes
set backspace=indent,eol,start

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" ====================================================
" Vim Startify Configuration Sample
" ====================================================

" Configure a custom header using a centered, boxed fortune.
" (Requires that fortune(6) is installed on your system)
let g:startify_header_full = 'startify#center(startify#fortune#boxed())'

" Define a list of bookmarks for quick access to frequently used files.
let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.zshrc',
  \ '~/Desktop/competitive-programming/main.cpp',
  \ '~/Desktop/competitive-programming/main1.cpp',
\ ]

" Set up custom commands to quickly access helpful information.
let g:startify_commands = [
  \ ['Version', ':version'],
  \ ['Help', ':help vim-startify'],
\ ]

" Customize the lists shown on the Startify screen.
let g:startify_lists = [
  \ { 'type': 'files',    'header': ['   Files'] },
  \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
  \ { 'type': 'bookmarks','header': ['   Bookmarks'] },
  \ { 'type': 'commands', 'header': ['   Commands'] },
\ ]

" Display file paths relative to the current directory.
let g:startify_relative_path = 1

" Map Shift+F1 to open the Startify screen manually.
nnoremap <silent> <S-F1> :Startify<CR>
" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
