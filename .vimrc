call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/gcmt/wildfire.vim.git'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'

call plug#end()
"use slate color theme
colorscheme slate 

"leader for wildfire
nmap <leader><Enter> <Plug>(wildfire-quick-select) 

" bisic.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Avoid garbled characters in Chinese language windows OS : confused
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Show line number on the left : useful
set number

" Height of the command bar : confused
set cmdheight=1

" Ignore case when searching : useful
set ignorecase

" When searching try to be smart about cases : useful
set smartcase

" Highlight search results : useless
" set hlsearch

" Makes search act like search in modern browsers : useful
set incsearch

" Turn on the wild menu : confused
set wildmenu

"Set 7 lines to the cursor - when moving vertically using j/k : confused
set so=7

" Configure backspace so it acts as it should act: useful
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Add a bit extra margin to the left : useless
"set foldcolumn=1

"No annoying sounds on errors : useful
set noerrorbells
set novisualbell

" Enable syntax highlighting : useful
syntax enable 

" Enable 256 colors palette in Gnome Terminal : useful
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode : useful
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language : useful
set encoding=utf8

" Use Unix as the standard file type : useful
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc. anyway... : useful
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs : useful
set expandtab

" Be smart when using tabs ;) : useful
set smarttab

" 1 tab == 4 spaces : useful
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters : useful
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines"

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers : useless, tmux is better
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character : useless
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
    return 'PASTE MODE  '
    endif
    return ''
endfunction

