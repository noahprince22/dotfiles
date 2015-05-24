set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'elzr/vim-json'
" Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Bundle 'szw/vim-ctrlspace'
Plugin 'majutsushi/tagbar'

" Snippets are separated from the engine.
Plugin 'honza/vim-snippets'

" gist-vim
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Clojure
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'jpalardy/vim-slime'

" Organization
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" Colors
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set modelines=0

" Have VIM use default ruby
let g:ruby_path="$HOME/.rvm/rubies/ruby-2.0.0-p353/bin/ruby"

" Point to Python for powerline
python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")

" Point to powerline
source /Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim/plugin/powerline.vim

" Point to RSense
let g:rsenseHome="/usr/local/Cellar/rsense/0.3/"

" Remap leader to `,`
let mapleader=","

" Set hidden recommended by CtrlSpace.
set hidden

" Enable Folding
set foldlevel=1
set foldnestmax=10
set nofoldenable
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 120 characters
set lbr
set tw=120

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Add line at 120 characters
set colorcolumn=120
set textwidth=120

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""
" => Manage Trailing Whitespace
"""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" Manual Whitespace Remove
" map <leader>ws :call DeleteTrailingWS()<cr>

" Deletes Trailing Whitespace on Save
autocmd BufWrite *.* :call DeleteTrailingWS()

" Display whitespace as `*`
set list
set listchars=tab:>\ ,trail:*

""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
map <leader>m :call VisualSelection('replace')<CR>
map <leader>n :call VisualSelection('gv')<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Enable tab completion on command line
set wildmenu
set wildmode=list:longest

" Always show 3 lines around the cursor
set scrolloff=3

" Highlight the cursor line
set cursorline

""""""""""""""""""""""""""""""
" => Configure Colors
""""""""""""""""""""""""""""""
" Use 256 bit colors
set t_Co=255

" Enable syntax highlighting
syntax enable
syntax on

" Use solarized dark
colorscheme solarized
set background=dark

" Enable clojure-highlight globally
let g:clojure_highlight_local_vars=1
let g:clojure_highlight_references=1

""""""""""""""""""""""""""""""
" => Vim Slime
""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

""""""""""""""""""""""""""""""
" => CtrlSpace
""""""""""""""""""""""""""""""
" Colors of CtrlSpace for Solarized Dark
" (MacVim and Console Vim under iTerm2 with Solarized Dark theme)

" Based on Solarized TablineSel
hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold

" Based on Solarized Tabline/TablineFill
" original Normal
" hi CtrlSpaceNormal   guifg=#839496 guibg=#073642 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
" tweaked Normal with darker background in Gui
hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE

" Based on Title
hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold

" Based on PmenuThumb
hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8

""""""""""""""""""""""""""""""
" => Vim-Json
""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal=0
let g:vim_json_warnings=0

""""""""""""""""""""""""""""""
" => Vim-Tags
""""""""""""""""""""""""""""""
let g:vim_tags_use_language_field=1

""""""""""""""""""""""""""""""
" => Syntastic Checker
""""""""""""""""""""""""""""""
" let g:syntastic_java_checkers=['checkstyle']
" let g:syntastic_java_checkstyle_classpath='$HOME/checkstyle-5.5/checkstyle-5.5-all.jar'
" let g:syntastic_java_checkstyle_conf_file='sun_checks.xml'

let g:syntastic_cursor_column=0
let g:syntastic_aggregate_errors=1
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_javascript_checkers=['gjslint']
let g:syntastic_yaml_checkers=['jsyaml']

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:syntastic_mode_map={ "mode": "active",
                               \ "active_filetypes": ["ruby", "java", "scala", "javascript", "html", "css"],
                               \ "passive_filetypes": [] }

""""""""""""""""""""""""""""""
" => Clojure Highlight
""""""""""""""""""""""""""""""
let g:clojure_align_multiline_strings=1

""""""""""""""""""""""""""""""
" => VIM Configuration Options
""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use a visual bell instead of a beep or flash
set visualbell

" Use fast terminal connection
set ttyfast

" Show cursor location
set ruler

" Allow backspacing over the following
" - indent  allow backspacing over autoindent
" - eol allow backspacing over line breaks (join lines)
" - start allow backspacing over the start of insert
set backspace=indent,eol,start

" Have gutter show line number
" set relativenumber " relative to cursor position
set number " normal

" Save undo histroy
set undofile

""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" Use cases when searching if upper case is used
set smartcase

" Show search results as it is typed
set incsearch

" Show match
set showmatch

" Highlight matches
set hlsearch

" Substitute all by default
set gdefault

" Format Options
" * q - Allow formatting of comments with `qq`
" * r - Insert comment on new line when in insert mode
" * n - Recognize numbered lists
" * 1 - Break lines before one letter words instead of after
set formatoptions=qrn1

"""""""""""""""""""""""""""""""""""""
" => Enable Mouse
"""""""""""""""""""""""""""""""""""""
" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm2

"""""""""""""""""""""""""""""""""""""
" => Force me to use VIM navigation
"""""""""""""""""""""""""""""""""""""
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"""""""""""""""""""""""""""""""""""""
" => Rainbow Parentheses
"""""""""""""""""""""""""""""""""""""
" Enable rainbow parentheses for all buffers
augroup rainbow_parentheses
au!
au VimEnter * RainbowParenthesesActivate
au BufEnter * RainbowParenthesesLoadRound
au BufEnter * RainbowParenthesesLoadSquare
au BufEnter * RainbowParenthesesLoadBraces
augroup END

" Rainbow Parentheses colours using Solarized
let g:rbpt_colorpairs=[
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

"""""""""""""""""""""""""""""""""""""
" => Gist Configuration
"""""""""""""""""""""""""""""""""""""
let g:gist_detect_filetype=1
let g:gist_clip_command='xclip -selection clipboard'
let g:gist_open_browser_after_post=1

let g:gist_api_url='http://api.github.com/'

"""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete

" Eclim autocomplete
let g:EclimCompletionMethod='omnifunc'

" Eclim disable validation
let g:EclimFileTypeValidate=0

"""""""""""""""""""""""""""""""""""""
" => Utilsnips
"""""""""""""""""""""""""""""""""""""
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-u>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""
" => Eclim Mappings
"""""""""""""""""""""""""""""""""""""
map <leader>pt :ProjectTree<cr>

"""""""""""""""""""""""""""""""""""""
" => Tabbar Mappings
"""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>b :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""
" => CtrlP Mappings
"""""""""""""""""""""""""""""""""""""
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>/ :CtrlPBuffer<cr>

"""""""""""""""""""""""""""""""""""""
" => Useful Mappings
"""""""""""""""""""""""""""""""""""""
" Remap localleader to `'`
let maplocalleader="'"

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" ; works like :
nnoremap ; :

" j-j works like escape
inoremap jj <ESC>

" C-(navigation) will work to change screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree toggling
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" leader space will clear search results
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files
autocmd BufReadPost
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" delimitMate
let delimitMate_excluded_ft="clojure"
let delimitMate_expand_cr = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg=@"
    execute "normal! vgvy"

    let l:pattern=escape(@", '\\/.*$^~[]')
    let l:pattern=substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.*')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/=l:pattern
    let @"=l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum=bufnr("%")
   let l:alternateBufNum=bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

