" Vim-Plug auto install
if empty(glob(('~/.config/nvim/autoload/plug.vim')))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'maralla/completor.vim'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
call plug#end()

let mapleader = "\\"                                             " set leader shortcut to a comma

set fileformats=unix,dos,mac
set number                                                      " show line numbers on the sidebar
set title                                                       " set the window’s title, reflecting the file currently being edited
set showbreak=↪                                                 " show arrow at breaking
set hidden                                                      " allow buffer switching without saving
set updatetime=250                                              " pretty much just so gittgutter will update quickly
set clipboard=unnamed,unnamedplus                               " set clipboard
set cursorline                                                  " highlight current line
set cursorcolumn                                                " highlight current column
set mouse=a                                                     " enable mouse use
set expandtab                                                   " convert tabs to spaces
set tabstop=4                                                   " indent using four spaces
set shiftwidth=4                                                " when shifting, indent using four spaces
set lazyredraw                                                  " don’t update screen during macro and script execution
set noshowmode
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__          " ignore files matching these patterns when opening files based on a glob pattern
set shortmess+=A                                                " avoid locking popup messages

set backup
set backupdir=~/.cache/nvim                                     " directory to store backup files
set directory=~/.cache/nvim                                     " directory to store swap files
set undofile                                                    " persistent undo
set undolevels=1000                                             " maximum number of changes that can be undone
set undoreload=10000                                            " maximum number lines to save for undo on a buffer reload

hi Comment cterm=italic
hi User1 cterm=reverse 

" Key maps {
    " Set working directory
    nnoremap <leader>. :cd %:p:h<CR>:pwd<CR>
    " Tabs
    nnoremap <Tab> gt
    nnoremap <S-Tab> gT
    nnoremap <silent> <S-t> :tabnew<CR>
    " Copy/Paste/Cut
    set pastetoggle=<F2>                                        " pasting text unmodified from other applications
    noremap YY "+y<CR>
    noremap <leader>p "+gP<CR>
    noremap XX "+x<CR>
    " Vmap for maintain Visual Mode after shifting > and <
    vmap < <gv
    vmap > >gv
    " Keep cursor centered into screen
    nnoremap j jzz
    nnoremap k kzz
    " Clean search highlight
    nnoremap <silent> <leader><space> :noh<CR>
" }

" fzf.vim {
    nnoremap <silent> <leader>b :Buffers<CR>
    nnoremap <silent> <leader>e :FZF -m<CR>
    nnoremap <silent> <leader>f :Ag<CR>
    set grepprg=ag\ --nogroup\ --nocolor
    set grepformat=%f:%l:%c:%m,%f:%l:%m
" }

" vim-go {
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_function_arguments = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1
    augroup VimGo
        au!
        au FileType go nmap <leader>t  <Plug>(go-test)
        au FileType go nmap <leader>gt <Plug>(go-coverage-toggle)
        au FileType go nmap <leader>i <Plug>(go-info)
        au FileType go nmap <buffer> <leader>d :GoDecls<CR>
        au FileType go nmap <buffer> <leader>dr :GoDeclsDir<CR>
    augroup END
" }

" completor.vim {
    let g:completor_gocode_binary = $GOPATH.'/bin/gocode'       " Go autocomplete
    let g:completor_python_binary = '/usr/bin/python'           " Python autocomplete
" } 

