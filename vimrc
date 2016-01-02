set nocompatible              		" be iMproved, required
filetype off                  		" required

set rtp+=~/.vim/bundle/Vundle.vim 	" set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 		" let Vundle manage Vundle, required

Plugin 'cscope.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/nerdtree'

call vundle#end()            		" required

" PLEASE KEEP IT IN MIND!
" filetype plugin indent on    		" required
 
syntax on 							" Enable syntax highlighting

" Options

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set mouse=a
set number
set tabstop=4
 
" Color scheme

set t_Co=256
set background=dark
colorscheme hybrid

" Mouse functions

function SmoothScroll(up)
    if a:up
       let scrollaction="^Y"
    else
       let scrollaction="^E"
    endif
      exec "normal " . scrollaction
    redraw
     let counter=1
 while counter<&scroll
        let counter+=1
         sleep 10m 
         redraw
        exec "normal " . scrollaction
 endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Useful mappings
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
map <C-i> :NERDTreeToggle<CR>

set cscopetag
cs add cscope.out  

nmap <C-\>s :call cscope#find('s', expand('<cword>'))<CR><CR>
nmap <C-\>g :call cscope#find('g', expand('<cword>'))<CR><CR>
nmap <C-\>c :call cscope#find('c', expand('<cword>'))<CR><CR>
