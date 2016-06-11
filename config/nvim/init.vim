call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'rking/ag.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'mhartington/oceanic-next'
"Plug 'Valloric/MatchTagAlways'
"
call plug#end()

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
" colorscheme onedark
" " hi Normal ctermbg=none
" let g:airline_theme='onedark'
" " following is a workaround fix for airline bgterm issue
" autocmd VimEnter * hi Normal ctermbg=none
" " let g:airline_theme='sol'
"
  set clipboard+=unnamedplus
" Currently needed for neovim paste issue
  set pastetoggle=<f6>
  set nopaste
" Let airline tell me my status
  set noshowmode
  filetype on
  set relativenumber number
  set tabstop=2 shiftwidth=2 expandtab
  set conceallevel=0
" block select not limited by shortest line
  set virtualedit=
  set wildmenu
  set laststatus=2
  "set colorcolumn=100
  set wrap linebreak nolist
  set wildmode=full
  let mapleader = ','
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" No need for ex mode
  nnoremap Q <nop>
" recording macros is not my thing
  map q <Nop>

nnoremap ; :
" Copy to osx clipboard
  vnoremap <C-c> "*y<CR>
  vnoremap y "*y<CR>
  nnoremap Y "*Y<CR>
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" Align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv
  map <esc> :noh<cr>

" turn on spelling for markdown files
autocmd FileType markdown,text,html setlocal spell complete+=kspell
" highlight bad words in red
autocmd FileType markdown,text,html hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

" NERDTree --------------------------------------------
"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-\> :NERDTreeToggle<CR>
" with NERDTree don't close all buffers
" http://stackoverflow.com/questions/31805805/vim-close-buffer-with-nerdtree
" nnoremap c :bp\|bd #<CR>
" shift-w to close current buffer
" nmap <S-w> :bd<CR>
nmap <S-w> :bp\|bd #<CR>
" close NERDtree if last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeAutoDeleteBuffer=1
  " NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
" let NERDTreeShowHidden=1
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
  call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('erb', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('rb', 'green', 'none', '#94B9A0', 'none')
  call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
  call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

"}}}

" Trigger filesystem notifications so guard picks up
set noswapfile

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey20

nmap <S-Left> :bprev<CR>
nmap <S-Right> :bnext<CR>

" move tabs to the end for new, single buffers (exclude splits)
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

" trim whitespace on close for filetypes
"autocmd FileType rb,js,erb,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Devicons https://github.com/ryanoasis/vim-devicons
set encoding=utf8
let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" Y should yank to end of line
nmap Y y$

" don't force saving a file to change buffers
set hidden

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = "ag --nogroup --column"

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --ignore .git --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" FZF ----------------------------
 map <c-p> :FZF<CR>
 tmap <c-p> <c-\><c-n>:FZF<CR>
 map <leader>a :Ag<CR>
 vmap <leader>aw y:Ag <C-r>0<CR>
 map <leader>h :History<CR>
 map <leader>l :Lines<CR>

" Terminal -----------------------
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:tnoremap <Esc> <C-\><C-n>
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
