" .vimrc
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'a0lex/Theosvi'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
 Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
" Plugin 'oblitum/YouCompleteMe'
" Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put non-Plugin stuff after this line

set encoding=utf-8
syntax on                         " show syntax highlighting
set autoindent                    " set auto indent
set ts=4                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
runtime macros/matchit.vim        " use % to jump between start/end of methods

set backspace=2
set pastetoggle=<F2>

" set dark background and color scheme
set t_Co=256
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Ctrl-Space for completions. Heck Yeah!
let mapleader="\<space>"
nnoremap <leader>rv :source $MYVIMRC<CR>

" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" movement
nnoremap j gj
nnoremap k gk

" latex filetype
let g:tex_flavor = "latex"
autocmd FileType tex setlocal textwidth=80

" resize
nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>h :exe "10winc < " <CR>
nnoremap <silent> <Leader>l :exe "10winc > " <CR>

"toggel linenumber
function! ToggleNu()
    if !exists( "b:myNu" )
        let b:myNu = 0
    endif
    let b:myNu = b:myNu + 1
    if b:myNu > 2 | let b:myNu = 0 | endif
    if b:myNu == 0
        set number
    elseif b:myNu == 1
        set relativenumber
    else
        set nonumber
        set norelativenumber
    endif
endfunction
nmap <silent> <F3> :call ToggleNu()<CR>

"switch spellcheck languages
let g:myLangList=["nospell","de_de","en_us","de_de,en_us"]
function! ToggleSpell()
    if !exists( "b:myLang" )
        if &spell
            let b:myLang=index(g:myLangList, &spelllang)
        else
            let b:myLang=0
        endif
    endif
        let b:myLang=b:myLang+1
        if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
        endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F6> :call ToggleSpell()<CR>


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" " youcompleteme
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 


