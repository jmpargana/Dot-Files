"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" General Setup
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set expandtab               " change indentation behaviour
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

set encoding=utf-8          " always needed
set fileencoding=utf-8

set nu rnu                  " show hybrid line numbers
set showcmd                 " show last command
set nofoldenable            " disable folding in markdown files
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu

filetype indent on          " indent according to each filetype
set showmatch               " show  parenthesis match
set history=500             " how many lines of history VIM remembers
syntax on                   " syntax highlighting
filetype plugin indent on

set nowrap                    " wrap text that exceeds screen width
set matchpairs+=<:>         "highlight pairs
set hlsearch                " highlight matching search patterns
set incsearch               " enable incremental search
set ignorecase              " ignore matching cases
set nocompatible            " open files with vim instead of vi

set so=7                    " set 7 lines to the cursor - when moving vertically
set ruler                   " always show current position
set cmdheight=1             " height of the command bar
set hid                     " a buffer becomes hidden when it is abandoned
set magic                   " for regex search

set nobackup                " disable backup, swap files, etc.
set nowb
set noswapfile
set lbr                     " break line on 100 characters
set tw=100

set guioptions-=r           " disable scrollbars
set guioptions-=R
set guioptions-=l
set guioptions-=L

set splitbelow              " set terminal to open below
set keywordprg=:Man





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","         " define the leader

" fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x<cr>
nmap <leader>o :only<cr>


" open terminal
nnoremap <leader>c :term<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!


" map space to search
noremap <space> /

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>


" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>




" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


" kill all windows
noremap <leader>bo :only<cr>

" close all buffers
noremap <leader>ba :bufdo :Bclose<cr>:tabclose<cr>gT

" navigate between buffers
noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" tab mappings
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>


" return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" parenthesis, brackets, quotes
" this is not needed since vim surrounding provides the same
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" filetypes with 2 spaces tab indentation
autocmd Filetype {{java,type}script{,react},html,dart} setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" force rescan syntax highlighting in this files extensions
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" autocmd BufNewFile, BufRead *.tsx,*.jsx set filetype=typescript.tsx


" type ,pu to install all plugins
noremap <leader>pu :PlugInstall<cr>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Setup Plugger and Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Automatically install Vim-Plug with all Plugins when first launched
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" configurations are in EDITING and PROGRAMMING sections
call plug#begin('~/.vim/plugged')


""""""""""""""""""""""""""""""""""""""""""""""
"""
""" EDITING TOOLS
"""
""""""""""""""""""""""""""""""""""""""""""""""

Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'



""""""""""""""""""""""""""""""""""""""""""""""
"""
""" THEMES
"""
""""""""""""""""""""""""""""""""""""""""""""""

Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'


""""""""""""""""""""""""""""""""""""""""""""""
"""
""" PROGRAMMING LANGUAGES
"""
""""""""""""""""""""""""""""""""""""""""""""""

" Syntax Checker and Auto Completion
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }

" Rust
Plug 'rust-lang/rust.vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" JavaScript for React
Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'hotoo/jsgf.vim'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/vim-jsx-improve'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components'
" Plug 'jparise/vim-gaphql'


" Dart
Plug 'dart-lang/dart-vim-plugin'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'kh3phr3n/python-syntax'           

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Theme Config
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" termguicolors don't work in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"""""""""""""""""""
"" THEME VARS
"""""""""""""""""""

" This needs some tweaking in your terminal theme as well
" - dark
" - light
set background=dark
" set t_Co=265

set termguicolors

" let ayucolor="light"        " some themes need to define variables before
" let g:solarized_termcolors=256


let g:material_terminal_italics = 1     " only for material

" Material Themes
" - lighter
" - palenight
" - ocean 
" - darker
let g:material_theme_style = 'lighter'


" Light
" - PaperColor  
" - auy
" - solarized
"
" Dark
" - nord
" - material
colorscheme material


" Change Colorscheme
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>



"""""""""""""""""""
"" TAB LINE
"""""""""""""""""""

" Either Airline or Lightline is needed
" I have both, since powerline fonts don't work 
" on one of my computers
" Some themes take care of these variables for you

" let g:lightline = { 'colorscheme': 'PaperColor' }
" let g:airline_theme='papercolor'


" air-line
let g:airline_powerline_fonts = 1
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''"





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MODES & PLUGIN SETUP
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ALEfix from ALE
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}


" prettier
noremap <leader>p :Prettier<cr> 

let g:vim_jsx_pretty_colorful_config = 1


" Dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

noremap <leader>df :DartFmt<cr>


" Go
noremap <leader>gb :GoBuild<cr>
noremap <leader>gi :GoInstall<cr>
noremap <leader>gt :GoTest<cr>
noremap <leader>gr :GoRun<cr>
noremap <leader>gf :GoFmt<cr>
noremap <leader>gd :GoDef<cr>
noremap <leader>gc :GoDoc<cr>
noremap <leader>gl :GoLint<cr>


" use the_silver_searcher if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif



" ACK 
" open ack and put the cursor in the right position
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" noremap <leader>g :Ack

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>



" Python PIPENV support
let pipenv_venv_path = system('pipenv --venv')

if shell_error == 0
    let venv_path = substitute(pipenv_venv_path, '\n', '', '')
    let g:ycm_python_binary_path = venv_path . '/bin/python'
else
    let g_ycm_python_binary_path = 'python'
endif

let g:ale_python_auto_pipenv = 1



" bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


" FZF
noremap <leader>f :GFiles <cr>
noremap <leader>F :Files <cr>


" MRU PLUGIN
" show files recently edited
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

noremap <leader>u :FZFMru<CR>


" CTAGS Setup
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

noremap <leader>. :Tags<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
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


function! CmdLine(str)
    call feedkeys(":" . a:str)
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


function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
