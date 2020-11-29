"---
" :)
"---

syntax on
filetype plugin indent on

set nowrap
set number

set tabstop=2
set shiftwidth=2
set expandtab

" Highlight current line
:set cursorline

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set the forward slash to be the slash of note.
set shellslash

" Make command line one line high
set ch=1

" set visual bell
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" No backup files
set nobackup
set nowritebackup

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions+=$

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" This is the timeout used while waiting for user input on a multi-keyed macro
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Files/Directories to be ignored on completion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Shows unwanted chars
set list
set listchars=tab:→\ ,trail:.

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth
set textwidth=80

" Apply color unti
set colorcolumn=80

" get rid of the silly characters in window separators
set fillchars=""

" Turn tabs into spaces

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Syntax coloring until
set synmaxcol=240

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"---
" Mappings
"---

let mapleader = ','

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> <leader>n :set invhls<CR>:set hls?<CR>

" Maps to make handling windows a bit easier
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"---
" Plugins
"---

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'gruvbox-community/gruvbox'

call plug#end()

"---
" Colour scheme
"---

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection = '0'

colorscheme gruvbox
set background=dark

"---
" fzf Settings
"---
nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>

let g:fzf_preview_window = []
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'down': '30%' }

" hide statusbar
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

"---
" nvim LSP Setting
"---
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require("lspconfig").tsserver.setup{ on_attach=require("completion").on_attach }
