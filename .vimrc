" general must haves
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
runtime! macros/matchit.vim
set nocompatible
set modelines=0

" tab me
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
"set autoindent

" make awesomer
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set mouse=a
cmap W w
nnoremap <F5> :GundoToggle<CR>

" tame searching
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ack<space>
nnoremap <tab> %
vnoremap <tab> %
nmap <silent> <Leader>cd :cd %:p:h<CR>

" handle columns
set wrap
set textwidth=79
set formatoptions=qrn1

" movement
set whichwrap=b,s,<,>,[,]

" colors and themes
syntax on
colorscheme ir_black
set t_Co=256
hi Pmenu ctermbg=238 gui=bold

" gui specific items
if has("gui_running")
    set colorcolumn=100
    set guioptions=egmrt
    set guifont=Monaco:h13
    colorscheme mustang
endif
" nerd tree
map <F2> :NERDTreeToggle<CR>

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" Smarty
au BufRead,BufNewFile *.tpl set filetype=smarty

" Toggle Mouse select and copy
nnoremap <F12> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse-=a
        echo "Mouse select will copy"
    else
        set mouse=a
        echo "Mouse sets visual mode"
    endif
endfunction
