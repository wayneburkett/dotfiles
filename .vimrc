set nocompatible                " vimproved

syntax enable
"colors default

" colors
if &term =~ "xterm-256color" || &term =~ "screen-256color"
    set t_Co=256                " hint to vim that we're in 256-color mode
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
endif

" formatting
set ts=4                        " display exisiting tabs as mod 4 indentation
set softtabstop=4               " pressing <tab> should indent by n characters...
set expandtab                   " ...and those characters should be spaces
set shiftwidth=4                " use mod-n indentation

" misc
set background=dark
set nowrap 
set diffopt+=iwhite
set mouse=a                     " enable mouse
set ttymouse=xterm2
set dir=$HOME/.vim/bak          " where to put swp files
set backup
set backupdir=$HOME/.vim/bak    " where to save tilde files
set writebackup
set showcmd                     " show the leader key
set number                      " show line nums
set autochdir                   " change pwd when opening new wins/tabs
set laststatus=2                " always show the statusline
set encoding=utf-8              " necessary to show Unicode glyphs

" searching
set hlsearch                    " highlight search
set incsearch                   " incremental search
set ignorecase                  " ignore case...
set smartcase                   " ...unless term has upper-case

" suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" auto-source .vimrc when file is saved
autocmd bufwritepost .vimrc source $MYVIMRC

" keep search results centered       
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" turn off search highlight
noremap <silent> <leader>n :noh<CR>

" search in new window
nnoremap <Leader>w :let @/=expand("<cword>")<Bar>split<Bar>normal n<CR>
nnoremap <Leader>W :let @/='\<'.expand("<cword>").'\>'<Bar>split<Bar>normal n<CR>

" print the date
nnoremap <F3> a<C-R>=strftime("# %Y-%m-%d")<CR><Esc>
inoremap <F3> <C-R>=strftime("# %Y-%m-%d")<CR>
nnoremap <F4> a<C-R>=strftime("# %Y-%m-%d %H:%M:%S")<CR><Esc>
inoremap <F4> <C-R>=strftime("# %Y-%m-%d %H:%M:%S")<CR>

" surround selected text with curly braces and indent
vnoremap <leader>b <ESC>'<O{<ESC>'>o}<ESC>V'<k=

" surround the current line with curly braces in normal mode
nnoremap <leader>b O{<ESC>jo}<ESC>Vkk=

" block comment
vnoremap <leader>c <ESC>'<O/*<ESC>'>o*/<ESC>V'<k

" syntax highlighting
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.log set filetype=error_log
au BufNewFile,BufRead Fastfile set syntax=ruby
au BufRead,BufNewFile *swift set filetype=swift

" PLUGIN-SPECIFIC STUFF BELOW
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" github repos
Plugin 'gmarik/vundle'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'spolu/dwm.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'arzg/vim-swift'

Plugin 'arzg/vim-colors-xcode'
"au FileType swift colorscheme xcodedark

Plugin 'brookhong/DBGPavim'
let g:dbgPavimPort = 9001
let g:dbgPavimBreakAtEntry = 1

Plugin 'Lokaltog/vim-powerline'
let g:Powerline_symbols='compatible'

" vim-scripts repos
Plugin 'xmledit'
Plugin 'python.vim'
Plugin 'php.vim'
Plugin 'badwolf'

Plugin 'vimwiki'
"nnoremap <silent> <leader>we :VimwikiAll2HTML<CR>

Plugin 'Syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_phpcs_disable=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

Plugin 'taglist.vim'
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Process_File_Always = 0
nnoremap <silent> <leader>t :TlistToggle<CR>

Plugin 'PDV--phpDocumentor-for-Vim'
nnoremap <C-p> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>

Plugin 'calendar.vim--Matsumoto'
nnoremap <silent> <leader>c :Calendar<CR>
let g:calendar_mark='right'

call vundle#end()            " required
filetype plugin indent on    " required

