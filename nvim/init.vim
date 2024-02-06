" I'm using a neovim plugin in vscode, some of this configuration
" causes issues inside of vscode, so just exit.
if exists('g:vscode')
  finish
endif

" Install vim-plug if it isn't already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

	" Allows <C>-hjkl to move between vim or tmux splits
	Plug 'christoomey/vim-tmux-navigator'

	" Syntax checking, works with Rust plugin.  
	" Other languages need checker installed.
	Plug 'vim-syntastic/syntastic'

	" Rust support
	Plug 'rust-lang/rust.vim'

	" Shortcuts for [-based navigations like [q, ]a, etc
	Plug 'tpope/vim-unimpaired'

	" 'conquer of completion', vscode-like auto completion
	" Need to install language specific extensions
	" ex: :CocInstall coc-rust-analyzer
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Auto closes brackets/etc in a mostly sane way
	Plug 'Raimondi/delimitmate'

" Don't forget to :PlugInstall after adding a new plugin!

call plug#end()

syntax enable
filetype plugin indent on
set shiftwidth=4 smarttab
set expandtab

set updatetime=300
inoremap jj <Esc>

" format markdown files to 65 width
" select text and `gq` to format existing text
autocmd BufNewFile,BufRead *.md set textwidth=65

" Don't continue comments when pressing o/O on a commented line
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

" Rust-specific configuration
let g:rustfmt_autosave = 1

" Javascipt-specific configuration
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" Update colors more to my liking (more subtle inlays/search/status/unused_var)
set termguicolors
highlight CocInlayHint guifg=#444444
highlight Search guibg=#333333 guifg='NONE'
highlight StatusLine guibg=#00ff00 guifg=#222222
highlight Conceal guibg='NONE' guifg=#555555

"""""""""""""""""""""""""""
"      PLUGIN CONFIG      "
"""""""""""""""""""""""""""

" Tells delimitmate to put cursor on indented blank line
" after opening brace then <CR>
let delimitMate_expand_cr = 1


" Always populate location list with issues, but don't show it by default
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0

" Check for issues on open, but not on close
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Tab cycles auto completion list, shift-tab reverses
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <CR> accepts selected suggestion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" CoC shortcuts for code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

