"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setup
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change indentation behaviour
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent

" always needed
set encoding=utf-8
set fileencoding=utf-8

" show hybrid line numbers
set nu rnu

" show last command
set showcmd

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" indent according to each filetype
filetype indent on

" show  parenthesis match
set showmatch

" how many lines of history VIM remembers
set history=500


" syntax highlighting
syntax on
filetype plugin indent on

" wrap text that exceeds screen width
set wrap

"highlight pairs
set matchpairs+=<:>

" highlight matching search patterns
set hlsearch

" enable incremental search
set incsearch

" ignore matching cases
set ignorecase

" open files with vim instead of vi
set nocompatible

" for file navigation
set path+=**

" commands for file jump
set tags=tags



" VIM user interface
" set 7 lines to the cursor - when moving vertically
set so=7

" always show current position
set ruler

" height of the command bar
set cmdheight=1

" a buffer becomes hidden when it is abandoned
set hid

" for regex search
set magic

" disable backup, swap files, etc.
set nobackup
set nowb
set noswapfile

" break line on 100 characters
set lbr
set tw=100

" disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" define the leader
let mapleader = ","

" fast saving
nmap <leader>w :w!<cr>


" :W sudo saves the file
" (useful for handling the permission-denied errror)
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!


" map space to search
noremap <space> /

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>


" split window and open edit command 
noremap <leader>v :vsp<cr><C-w>l:e 
noremap <leader>s :sp<cr><C-w>j:e 


" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


" close current buffer
noremap <leader>bc :Bclose<cr>:tabclose<cr>gT

" close all buffers
noremap <leader>ba :bufdo :Bclose<cr>:tabclose<cr>gT

" navigate between buffers
noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" tab mappings
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove<cr>
noremap <leader>t<leader> :tabnext

noremap <leader>tl :tabr<cr>
noremap <leader>th :tabl<cr>

" open new tab with the current buffer's path
noremap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" parenthesis, brackets, quotes
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Plugger and Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" configurations are in EDITING and PROGRAMMING sections
call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/mru.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


call plug#end()


" type ,pu to install all plugins
noremap <leader>pu :PlugInstall<cr>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme Config
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

colorscheme PaperColor


let g:airline_theme='simple'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" multiple cursors
" https://github.com/terryma/vim-multiple-cursors


" vim-surround
" surround selected text with any given char
" https://github.com/tpope/vim-surround
" REALLY POWERFULL!!


" NERDTree
noremap <leader>nn :NERDTreeToggle<CR>


" Emmet
" <C-y>,


" Rainbow Parenthesis Improved
let g:rainbow_active=1


" autopairs
" https://github.com/jiangmiao/auto-pairs


" prettier
noremap <leader>p :Prettier<cr> 



" use the_silver_searcher if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif


" ACK 
" open ack and put the cursor in the right position
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
noremap <leader>g :Ack

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


" MRU PLUGIN
" show files recently edited
let MRU_Max_Entries = 300
noremap <leader>u :MRU<CR>



" vim room (its really cool!)
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


" bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>



" FZF
noremap <leader>f :GFiles <cr>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Since all guides advise you not to install plugins
" when you start using vim the following ones will
" only be installed in the future


" Autogroups https://dougblack.io/words/a-good-vimrc.html
" learn how to define custom values for each language mode

" Command-T https://github.com/wincent/Command-T
" open files and buffers and jump between tags

" ctrl.vim https://github.com/kien/ctrlp.vim
" fuzzy file, buffer, mru, tag finder

" repeat.vim https://github.com/tpope/vim-repeat
" I'm not sure what this one does

" NERDCommenter https://github.com/scrooloose/nerdcommenter
" comment script for vim

" ALE https://github.com/dense-analysis/ale
" Syntax checker server

" commentary.vim https://github.com/tpope/vim-commentary



" Other links
" VIM AWESOME - https://linuxhint.com/vim_awesome/
" awesome vim (github) - https://github.com/akrawchyk/awesome-vim
" ultimate vim config - https://github.com/amix/vimrc




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions from amix vimrc 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

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



function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
