
" very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/



" ==================================
" Settings
" ==================================

" Gui options
set guioptions-=T " remove toolbar in gui mode
set backspace=2 " backspace across lines
set colorcolumn=100
set showcmd " show partial commands in status line

" show hidden chars
set nolist
set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:·,tab:>-

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nomodeline

if has('mouse')
    set mouse=a
endif

set path+=**
set wildmenu

set shell=$SHELL
set modeline
set cursorline
set number

" syntax
syntax enable


set formatoptions=tc " wrap test and comments using text width"
set formatoptions+=r " continue comments when pressing ENTER in insert mode"
set formatoptions+=q " enabling formatting of comments with gq"
set formatoptions+=n " detect lists for formatting"
set formatoptions+=b " auto wrap in insert mode"


" timeouts
set ttimeoutlen=50
set timeoutlen=1000

set title
set hidden
set showmatch

set hlsearch
set incsearch
set magic
set nowrap

" tags
set tags=.git/tags


" Splitting
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile


" Better search
set incsearch
set ignorecase
set smartcase
set gdefault

nnoremap <silent> n n:call BlinkNextMatch()<CR>
nnoremap <silent> N N:call BlinkNextMatch()<CR>

function! BlinkNextMatch() abort
  highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold

  let pat = '\c\%#' . @/
  let id = matchadd('JustMatched', pat)
  redraw

  exec 'sleep 150m'
  call matchdelete(id)
  redraw
endfunction

nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap <silent> <Esc> :silent noh<Bar>echo<CR>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" automatically yank to clipboard
set clipboard=unnamedplus

" turn on line numbers
set number

" ==================================
" REMAPPINGS
" ==================================

" make sure capital letters also write and quit
cnoreabbrev W w
cnoreabbrev X x
cnoreabbrev Q q

" indenting
nnoremap <tab> >>_          " increase indent with >>
nnoremap <s-tab> <<_        " decrease indent with <<
inoremap <s-tab> <c-d>
vnoremap <Tab> >gv          " tab to increase indent
vnoremap <S-Tab> <gv        " shift tab to decrease indent

map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

nnoremap ; :

" Jump to start and end of line using the home row keys
map H ^
map L $



" ==================================
" Ale linting
" ==================================
let g:ale_linters = {}
let g:ale_linters.rust = ['cargo', 'rustfmt', 'rls']
let g:ale_linters.go = ['go build', 'gofmt', 'go vet']
let g:ale_linters.ts = ['eslint']
let g:ale_linters.js = ['eslint']
let g:ale_linters.python = ['autopep8', 'mypy']
let g:ale_linters.c = ['gcc']
let g:ale_linters.cpp = ['gcc']
let g:ale_linters.ASM = ['gcc']
let g:ale_rust_rls_toolchain = 'stable'

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_balloons=1


" ==================================
" Plugins
" ==================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ziglang/zig.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


Plug 'airblade/vim-rooter'

" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ask for password when editing priv file
Plug 'lambdalisue/suda.vim'
Plug 'crusoexia/vim-monokai'
Plug 'scrooloose/nerdtree'

" bottom bar looks nice
Plug 'itchyny/lightline.vim'

" async linting
Plug 'dense-analysis/ale'

Plug 'machakann/vim-highlightedyank'
call plug#end()



" ==================================
" Colors
" ==================================
colorscheme monokai
set background=dark
highlight Normal ctermfg=230 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
highlight Pmenu ctermfg=grey ctermbg=black


" ==================================
" Plugin settings
" ==================================

" Sudo
let g:suda_smart_edit = 1
filetype plugin indent on


" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" ==================================
" Coc
" ==================================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()


map <C-f> :NERDTreeToggle<CR>


" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>
nnoremap <silent> <space>a  :CocAction<cr>

" Auto commands



" Disable arrow keys
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
