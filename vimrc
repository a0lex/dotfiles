call plug#begin('~/.vim/plugged')

if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'majutsushi/tagbar'
Plug 'rakr/vim-one'
Plug 'tomtom/tcomment_vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/vim-grammarous'
Plug 'dbmrq/vim-ditto'
" " Plug 'dense-analysis/ale'
" " Plug 'chrisbra/SudoEdit.vim'
" " Plug 'tpope/vim-dispatch'
" " Plug 'jamessan/vim-gnupg'
" " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()}}

call plug#end()

" " Settings
syntax on                         " show syntax highlighting

set encoding=utf-8
set ts=3                          " set indent to 4 spaces
set shiftwidth=3
set expandtab                     " use spaces, not tab characters
set updatetime=750
set scrolloff=6                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set backspace=2
set autoindent                    " set auto indent
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ruler                         " show row and column in footer
set noswapfile
set autoread
set splitbelow
set splitright
set clipboard=unnamed
set cm=blowfish2
set list                         " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set undofile                     " Maintain undo history between sessions
set undodir=~/.vim/undodir
set pastetoggle=<F2>
set timeoutlen=1000 ttimeoutlen=0
set viminfo='100,f1
set visualbell t_vb=

filetype plugin indent on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" reload config
let mapleader="\,"
nnoremap <leader>rv :source $MYVIMRC<CR>

" Theme
" let g:airline_theme='one'
if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
endif
set background=dark
colorscheme one


" Highlight
hi MatchParen cterm=bold,underline ctermbg=none ctermfg=12

" quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" remap ESC
inoremap jk <ESC>

" movement
nnoremap j gj
nnoremap k gk

" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <silent> <C-w>w :ZoomWin<CR>

" search
nnoremap <leader><leader> :nohlsearch<CR>

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='papercolor'


" Deoplete
let g:deoplete#enable_at_startup = 1

" Change the cursor from block to i-beam in INSERT mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Lex
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_winsize = 15
let g:netrw_preview = 1

" ag
cnoreabbrev Ack Ack!
nnoremap <Leader><Leader>a :Ack!<Space>
let g:ackprg = 'ag --vimgrep'

" mapping
nmap <F6> :TagbarToggle<CR>

" Switch Buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" Change Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.cls set filetype=tex
let g:tex_flavor='latex'

" set wrap on diff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" IndentLine
" let g:indentLine_char = '¦'
" let g:indentLine_first_char = '¦'
" let g:indentLine_setColors = 0
" let g:indentLine_concealcursor = ''
" let g:indentLine_conceallevel = 1
" set conceallevel=1



" ctrlP -- Exclude
set wildignore+=*/tmp/*,Rohdaten*,Material*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
         \ 'dir':  '\v[\/]\.(git|hg|svn)$',
         \ 'file': '\v\.(exe|so|dll)$',
         \ 'link': 'some_bad_symbolic_links',
         \ }

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/mysnippet'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippet"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
nnoremap <silent> <F3> :call ToggleNu()<CR>

" switch spellcheck languages
hi clear SpellBad
highlight SpellBad ctermbg=124
hi SpellBad cterm=underline
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
nnoremap <silent> <F4> :call ToggleSpell()<CR>

" vim-languagetool languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.3/libexec/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,EN_UNPAIRED_BRACKETS'
let g:languagetool_enable_rules='PASSIVE_VOICE'
let g:languagetool_lang="de-DE"

" Easy Align
xmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
         \ '%': { 'pattern': '%' },
         \ ';': { 'pattern': ';' }
         \ }

" vimtex
autocmd BufReadPre *.tex let b:vimtex_main = 'report.tex'
let g:tex_conceal = ''
let g:vimtex_view_method = 'skim'
" let g:vimtex_indent_conditionals = {
"  \ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse|beginwith)@!',
" \ }
let g:vimtex_fold_enabled = 0
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_echo_verbose_input = 0
let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_compiler_latexmk_engines = {
         \ '_'                : '-lualatex',
         \ 'pdflatex'         : '-pdf',
         \ 'dvipdfex'         : '-pdfdvi',
         \ 'lualatex'         : '-lualatex',
         \ 'xelatex'          : '-xelatex',
         \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
         \ 'context (luatex)' : '-pdf -pdflatex=context',
         \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
         \}
let g:vimtex_compiler_latexrun_engines = {
         \ '_'                : 'lualatex',
         \ 'pdflatex'         : 'pdflatex',
         \ 'lualatex'         : 'lualatex',
         \ 'xelatex'          : 'xelatex',
         \}
let g:vimtex_compiler_latexmk = {
         \ 'backend' : 'jobs',
         \ 'background' : 1,
         \ 'build_dir' : '/tmp/latex/output',
         \ 'callback' : 1,
         \ 'continuous' : 1,
         \ 'executable' : 'latexmk',
         \ 'options' : [
         \   '-verbose',
         \   '-file-line-error',
         \   '-synctex=1',
         \   '-interaction=nonstopmode',
         \ ],
         \}

" FastFold
let g:tex_fold_enabled = 1

" Grammarous
nmap gf <Plug>(grammarous-fixit)
nmap gn <Plug>(grammarous-move-to-next-error)
nmap gp <Plug>(grammarous-move-to-previous-error)

" vim-better-whitespace
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Colorizer
:au BufNewFile,BufRead *.log,*.css,*.html,*.htm  :ColorHighlight!
:let g:colorizer_auto_map = 1
