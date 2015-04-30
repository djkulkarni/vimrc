" fon't make vim compatibel with vi
set nocompatible
" turn on syntax highlighting
syntax on
" show line numbers
set number

"reload files changed outside vim
set autoread
" encoding is utf8
set encoding=utf-8
set fileencoding=utf-8
" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" By default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" set unix line endings
set fileformat=unix
" When reading files try unix line endings, then dos, also use unix for new
" buffers
set fileformats=unix,dos

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
" use system clip board
set clipboard=unnamed
" set backup directory
set backupdir=C:\DJ\vim_files\vim_backup
" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile
" vim undo files
set undodir=C:\DJ\vim_files\vim_undofiles
" remove the menu bar
set guioptions-=m
" remove the toolbar
set guioptions-=T
"remove the right-hand scroll bar
set guioptions-=r
"set gui fonts
set guifont=Source\ Code\ Pro
" suggestion for normal mode commands
set wildmode=list:longest
" set the colorscheme to zenburn
colors zenburn

behave mswin
nnoremap <F9> :NERDTreeToggle C:\

" indentation
set autoindent        " autoindent based on the line above, works most of the time
set smartindent       " smarter indent for C-like languages
set shiftwidth=4      " when reading, tabs are 4 spaces
set softtabstop=4    " in insert mode, tabs are 4 spaces

" restrict line width to 80 characters
set textwidth=80

" start maximised
autocmd GUIEnter * simalt ~x

" Set omnicomplete for javascript, HTML, CSS, Python
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=syntaxcomplete#Complete

inoremap <C-Space> <C-x><C-o>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype plugin off
" ------------------------ PLUGIN CONFIGURATION ---------------
" Initiate vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
 " Let vundle manage vundle, required
Plugin 'gmarik/Vundle.vim'

" Start plugin definition
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'itchyny/lightline.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'

" snippets are separated from the engine.
Plugin 'honza/vim-snippets'

" -- Web development
Plugin 'Shutnik/jshint2.vim'
Plugin 'mattn/emmet-vim'
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" end plugin definition
call vundle#end()    " required for vundle

" Start NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree C:\
autocmd VimEnter * wincmd p

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" Use zencoding with <C-E>
let g:user_emmet_leader_key = '<c-e>'

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" Trigger configuration for ultisnips.
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" To make UltiSnipsEdit split the window vertically
let g:UltiSnipsEditSplit="verticle"


" run JSHint when a file with .js extension is saved
autocmd BufWritePost *.js silent :JSHint

" Automatically change the current directory to the file we are editing
set autochdir
autocmd FileType python :UltiSnipsAddFiletypes python
autocmd FileType html :UltiSnipsAddFiletypes html
autocmd FileType c :UltiSnipsAddFiletypes c
autocmd FileType cpp :UltiSnipsAddFiletypes cpp
autocmd FileType javascript :UltiSnipsAddFiletypes javascript
autocmd FileType css :UltiSnipsAddFiletypes css
autocmd FileType cs :UltiSnipsAddFiletypes cs
autocmd FileType vim :UltiSnipsAddFiletypes vim

