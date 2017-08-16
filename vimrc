set nocompatible              		" be iMproved, required
filetype off                  		" required

set rtp+=~/.vim/bundle/Vundle.vim 	" set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 		" let Vundle manage Vundle, required

Plugin 'cscope.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'

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
set shiftwidth=4
 
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

"nnoremap <C-\>s :call cscope#findInteractive(expand('<cword>'))<CR>

" nmap <C-\>s :call cscope#find('s', expand('<cword>'))<CR><CR>
" nmap <C-\>g :call cscope#find('g', expand('<cword>'))<CR><CR>
" nmap <C-\>c :call cscope#find('c', expand('<cword>'))<CR><CR>
nmap <F8> :TagbarToggle<CR>

let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let mapleader = "\<Space>"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

set updatetime=250
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

 let g:syntastic_c_compiler = "/opt/intel/cgm_sw_r7.0er5-rdkb-2.1-20161205/build-puma7-atom/tmp/sysroots/x86_64-linux/usr/bin/core2-32-rdk-linux/i586-rdk-linux-gcc"

let g:syntastic_c_include_dirs = [ '../include', 'include', '/home/stanislav/Work/sources/git/4.6.x/utils/libnl-1.1.4/include', '/home/stanislav/Work/sources/git/4.6.x/kernel/cl_drv', '/home/stanislav/Work/sources/git/4.6.x/utils/iw', '/home/stanislav/Work/sources/git/4.6.x/utils/wlan_api' ]
