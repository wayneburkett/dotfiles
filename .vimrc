set nocompatible				" vimproved
filetype plugin indent on		" automatically detect file types

syntax enable
colors default

" colors
if &term =~ "xterm-256color" || &term =~ "screen-256color"
	set t_Co=256				" hint to vim that we're in 256-color mode
	set t_AB=[48;5;%dm
	set t_AF=[38;5;%dm
endif

" formatting
set ts=4						" display exisiting tabs as mod 4 indentation
set softtabstop=4				" pressing <tab> should indent by n characters...
"set expandtab					" ...and those characters should be spaces
set shiftwidth=4				" use mod-n indentation

" misc
set background=dark
set nowrap 
set diffopt+=iwhite
set backup
set mouse=a						" enable mouse
set ttymouse=xterm2
set dir=$HOME/.vim/bak			" where to put swp files
set backupdir=$HOME/.vim/bak	" where to save tilde files
set tags=$HOME/.vim/tags/php
set showcmd						" show the leader key
set number						" show line nums
set autochdir					" change pwd when opening new wins/tabs
set laststatus=2				" always show the statusline
set encoding=utf-8				" necessary to show Unicode glyphs
"set list listchars=tab:»·,trail:·
"map <Leader>ct :!ctags -R .<CR>

" searching
set hlsearch					" highlight search
set incsearch					" incremental search
set ignorecase					" ignore case...
set smartcase					" ...unless term has upper-case

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

" toggle hlsearch
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

" colors for Showmarks
hi LineNr ctermfg=Black ctermbg=lightgrey cterm=bold
hi ShowMarksHLl ctermbg=Black ctermfg=Brown cterm=bold guibg=Black guifg=Brown gui=bold
hi ShowMarksHLu ctermbg=Black ctermfg=Brown cterm=bold guibg=Black guifg=Brown gui=bold
hi ShowMarksHLo ctermbg=Black ctermfg=Brown cterm=bold guibg=Black guifg=Brown gui=bold
hi ShowMarksHLm ctermbg=Black ctermfg=Brown cterm=bold guibg=Black guifg=Brown gui=bold

" PLUGIN-SPECIFIC STUFF BELOW

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos
Bundle 'gmarik/vundle'
Bundle 'spolu/dwm.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/tComment'

" vim-scripts repos
Bundle 'ShowMarks'
Bundle 'vimwiki'
"Bundle 'phpqa'
"Bundle 'YankRing.vim'
"Bundle 'DBGp-client'

Bundle 'Syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_phpcs_disable=1

Bundle 'taglist.vim'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1
nnoremap <silent> <leader>t :TlistToggle<CR>

Bundle 'PDV--phpDocumentor-for-Vim'
nnoremap <C-p> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>

Bundle 'calendar.vim--Matsumoto'
nnoremap <silent> <leader>c :Calendar<CR>
let g:calendar_mark='right'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='compatible'
