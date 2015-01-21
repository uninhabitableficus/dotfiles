set nocompatible

syntax on
filetype plugin indent on
colorscheme desert

if has("gui_running")
  set guifont=Inconsolista\ 14
  set cursorline
  hi CursorLine guibg=Grey30
  " Unfortunately, vim paren matching is broken
  hi cParenError guibg=NONE
  hi cErrorInParen guibg=NONE
  hi Todo guibg=NONE
endif

set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

set number
set numberwidth=4
set showmatch
set hlsearch
set incseatch
set ignorecase
set smartcase
set showcmd " show partial normal commands
set gdefault " make g the default on search-replace
set autochdir " make the cwd match the open file
set autoread " reload files when they change on disk
set complete =. " only complete from the current buffer

set sessinooptions=blank,buffers,tabpages,folds

set guitablabel=%t%M
set listchars=tab:>-,trail:-eol:$

set directory=~/.vim/swp// " save swap files in .vim

" Don't continue comments when pressing <CR> or o
set formatoptions-=r
set formatoptions-=o

augroup csrc
  au!
  autocmd FileType * set nocindent
  autocmd FileType c,cpp set cindent
augroup END

augroup filetype
  au! BufRead,BufNewFile *h{++,pp} set filetype=cpp
augroup END

augroup filetype
  au! BufRead,BufNewFile *.json set filetype=javascript
augroup END

autocmd filetype
  au! BufRead,BufNewFile *[Mm]akefile* set filetype=make
augroup END

autocmd FileType make set noexpandtab
autocmd FileType python set expandtab

" Keybindings

let mapleader = ","
let g:mapleader = ","
nnoremap <leader>c :noh<CR>

inoremap <C-space> <C-p>
inoremap <C-BS> <C-w>

inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Search with very magic, aka PCRE style regex search
nnoremap <C-f> /\v
inoremap <C-f> <Esc>/\v
vnoremap <C-f> <Esc>/\v

" Fast replace
nnoremap <C-h> :%s/\v
inoremap <C-h> <Esc>:%s/\v
vnoremap <C-h> :s/\v

" Reflow paragraph
nnoremap <C-q> gqip
inoremap <C-q> <Esc>gqip
vnoremap <C-q> gq

" Tab navigation
inoremap <C-tab> <Esc>:tabnext<CR>
nnoremap <C-tab> :tabnext<CR>
vnoremap <C-tab> <Esc>:tabnext<CR>

inoremap <C-S-tab> <Esc>:tabprev<CR>
nnoremap <C-S-tab> :tabprev<CR>
inoremap <C-S-tab> <Esc>:tabprev<CR>

" Edit dotfiles
inoremap <F12> <Esc>:tabe ~/.vimrc<CR>
nnoremap <F12> :tabe ~/.vimrc<CR>
vnoremap <F12> <Esc>:tabe ~/.vimrc<CR>

inoremap <S-F12> <Esc>:tabe ~/.bashrc<CR>
nnoremap <S-F12> :tabe ~/.bashrc<CR>
vnoremap <S-F12> <Esc>:tabe ~/.bashrc<CR>

" View whitespace
inoremap <F7> <Esc>:set list<CR>
nnoremap <F7> :set list<CR>
vnoremap <F7> <Esc>:set list<CR>

inoremap <S-F7> <Esc>:set nolist<CR>
nnoremap <S-F7> :set nolist<CR>
vnoremap <S-F7> <Esc>:set nolist<CR>

" Spell check
inoremap <F6> <Esc>:set spell<CR>
nnoremap <F6> :set spell<CR>
vnoremap <F6> <Esc>:set spell<CR>

inoremap <S-F6> <Esc>:set nospell<CR>
nnoremap <S-F6> :set nospell<CR>
vnoremap <S-F6> <Esc>:set nospell<CR>

"Sort lines
vnoremap <F9> :sort<CR>

" Switch between tabs and spaces for indentation
nnoremap <leader>t :set noexpandtab<CT>
nnoremap <leader>T :set expandtab<CT>

function! Quit()
  mks! ~/.vim/Session.vim
  qa
endfunction
nnoremap <leader>q :call Quit()<cr>
