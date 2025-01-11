" Use space characters instead of tabs.
set expandtab

" Indent settings
set tabstop=4 softtabstop=4 shiftwidth=4

" Add line numbers
set number ruler

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Set the commands to save in history default number is 20.
set history=1000

" Do not save backup files.
set nobackup
