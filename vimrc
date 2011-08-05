" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

syntax on

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set the tab-space to 2
set ts=2

" Set the line numbers
set number

" Auto indent
set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!^F

" Source a auto completion configuration file if available
if filereadable("/etc/vim/autocomplete.vim")
  source /etc/vim/autocomplete.vim
endif

" Map :w!! to ask for sudo password and save as root
cmap w!! %!sudo tee > /dev/null %

