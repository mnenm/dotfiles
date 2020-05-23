syntax on
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932
set fileformats=unix,dos,mac
set number
set ruler
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nobackup
set noswapfile
set cursorline
set showcmd
set laststatus=2
set history=100
set smartcase
set showmatch
set hlsearch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P]']'}
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent><C-m> :setlocal number!<CR>

colorscheme elflord

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'hashivim/vim-terraform'
NeoBundle 'aklt/plantuml-syntax'
call neobundle#end()
filetype plugin indent on

NeoBundleCheck

nnoremap <silent><C-n> :NERDTree<CR>

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

au FileType php nnoremap <C-e> :!php -e %<CR>
au FileType php nnoremap <C-l> :!php -l %<CR>
autocmd FileType php setlocal autoindent sw=4 sts=4 ts=4

au FileType ruby nnoremap <C-e> :!ruby %<CR>
au FileType python nnoremap <C-e> :!python %<CR>
au FileType elixir nnoremap <C-e> :!elixir %<CR>
au FileType go nnoremap <C-e> :!go run %<CR>
au FileType scala nnoremap <C-e> :!scala %<CR>
au FileType typescript nnoremap <C-e> :!ts-node %<CR>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

let g:ackprg = 'rg --vimgrep --no-heading'

let g:terraform_fmt_on_save = 1

autocmd BufNewFile *.sh 0r $HOME/dotfiles/templates/sh.txt

"-----------------
" vim-go setting
"------------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

"---------------
" ctags
"---------------
map <C-\> :tab stj <C-R>=expand(<'cword'>)<CR><CR>

"---------------
" jasmine.vim
"---------------
function! JasmineSetting()
  au BufRead,BufNewFile *Helper.js,*Spec.js set filetype=jasmine.javascript
  au BufRead,BufNewFile *Helper.coffee,*Spec.coffee set filetype=jasmine.coffee
  au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee let b:quickrun_config={ 'type': 'coffee' }
  call jasmine#load_snippets()
  map <buffer> <leader>m :JasmineRedGreen<CR>
  command! JasmineRedGreen :call jasmine#redgreen()
  command! JasmineMake :call jasmine#make()
endfunction
au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"---------------
" indent_guides
" ---------------
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1
autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=darkblue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
au FileType php,ruby,coffee,javascript,python,elixir,go IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

" ---------------
"  rubocop
" ---------------
let g:syntastic_mode_map={ 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop']

" ---------------
"  plantuml
" ---------------
let g:plantuml_executable_script="~/dotfiles/cmd/plantuml_publish"
au FileType plantuml nnoremap <C-e> :make<CR>
