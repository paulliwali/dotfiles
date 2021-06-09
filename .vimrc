" My Vimrc file
" Maintainer: Paul Deng

"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible
" required! by vundle
filetype off

"" Vundle
"" See :help vundle for more details
"" Using vundle instead of pathogen because it incorporates pathogen's sub-module style with git
"" https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! by vundle
Bundle 'gmarik/vundle'

" Git Repos by http://vim-scripts.org ( get names from https://github.com/vim-scripts/following )
"Bundle 'Conque-Shell'
"Bundle 'JSON.vim'
"Bundle 'calendar.vim--Matsumoto'
"Bundle 'python.vim--Vasiliev'

" Git Repos on GitHub
" Inspired from http://sontek.net/turning-vim-into-a-modern-python-ide
"Bundle 'AD7six/vim-independence'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'davidhalter/jedi-vim'
"Bundle 'fuenor/vim-wordcount'
"Bundle 'gmarik/ide-popup.vim'
"Bundle 'godlygeek/tabular'
"Bundle 'hsitz/VimOrganizer'
"Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'majutsushi/tagbar'
"Bundle 'mattn/zencoding-vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'roman/golden-ratio'
"Bundle 'sjl/gundo.vim'
"Bundle 'sjl/threesome.vim'
"Bundle 'swaroopch/vim-markdown'
"Bundle 'swaroopch/vim-markdown-preview'
"Bundle 'tpope/vim-git'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'chrisbra/NrrwRgn'
"Bundle 'guns/vim-clojure-static'
"Bundle 'jceb/vim-orgmode'
"Bundle 'juvenn/mustache.vim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'msanders/snipmate.vim'
Bundle 'nvie/vim-flake8'
"Automatically run Flake8 everytime a Python file is written
autocmd BufWritePost *.py call Flake8()
" Changing hotkey for Flake8
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'sukima/xmledit'
"Bundle 'tpope/vim-classpath'
"Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-speeddating'
"Bundle 'vim-pandoc/vim-pandoc'

" Git Repos not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'

"" General Settings

" Sytax settings
syntax on
set t_Co=256

" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix

" Automatically indent when adding a curly bracket, etc.
" required! by vundle
filetype plugin indent on
set autoindent
set smartindent

" Lines longer than 99 columns will be broken
set textwidth=99
" Default autoindentation to 4 spaces 
set shiftwidth=4
" TABs converted to 4 spaces
set tabstop=4
" Insert spaces when hitting TABs 
set expandtab
" Insert TABs on the start of a line according to shiftwidth, not tabstop
set smarttab
" Allowing backspace overeverthing in insert mode
set backspace=indent,eol,start
" Allowing autoindentation
set autoindent
" Allowing line numbers
set number

" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" Show special characters
if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
else
    set list listchars=tab:>-,trail:.,extends:>
endif

" Text mode
command TextMode setlocal nolist wrap linebreak scrolloff=999

" Highlight current line
set cursorline

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Minimal number of screen lines to keep above and below the cursor.
" This keeps the cursor always in the vertical middle of the screen.
set scrolloff=999

" Use UTF-8
set encoding=utf-8

" For command history and buffer size
set history=1000
set undolevels=1000

" Silent vim
set visualbell
set noerrorbells

" Set vim's terminal title to the filename
set title

" Remove vim's backup features, as we utilize git already
set nobackup
set noswapfile

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

" Tab line
" Refer ':help setting-guitablabel'
function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, '&modified')
            let label = '[+] '
            break
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= wincount
    endif
    if label != ''
        let label .= ' '
    endif

    return label

endfunction

set guitablabel=%{GuiTabLabel()}\ %t

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case while searching
set ignorecase

" Ignore case if all search term is lower-case, case-sensitive otherwise
set smartcase

" Make /g flag default when doing :s
set gdefault

" Show autocomplete menus
set wildmenu

" Show editing mode
set showmode

" Ignore certain filetypes when doing filename completion
set wildignore=*.sw*,*.pyc,*.bak

" Show matching brackets
set showmatch

" Bracket blinking
set matchtime=2

" Split new window below current one
set splitbelow

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" Disable highlighting after search. Too distracting.
set nohlsearch

" Disable spellcheck by default
set nospell
autocmd BufRead,BufNewFile * setlocal nospell
" To enable again, use:
" setlocal spell spelllang=en_us

" Copy full buffer to OS clipboard.
function! CopyAll()
    normal mzggVG"+y'z
    call Say("Copied.")
endfunction
command A call CopyAll()

" Delete buffer contents and Paste from OS clipboard.
function! PasteFromClipboard()
    normal ggVGd"+p1G
    call Say("Pasted.")
endfunction
command B call PasteFromClipboard()

" Markdown files are plain text files
autocmd FileType markdown TextMode
autocmd FileType pandoc TextMode
let g:pandoc_no_folding = 1
" Allow these file extensions to be accessed via 'gf' of only the name, for
" e.g. gf on [[AnotherPage]] should go to AnotherPage.pd
set suffixesadd=.pd,.txt

" Python
let python_highlight_all=1
" PEP8 compliance - http://www.python.org/dev/peps/pep-0008/
autocmd FileType python set colorcolumn=100

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Reload all windows in all tabs, useful after I do a 'git rebase -i'
command Reedit :tabdo windo edit!

" vim: filetype=vim
