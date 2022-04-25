syntax on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'psf/black'
" let g:fzf_install = 'yes | ./install'
" Plug 'junegunn/fzf', { 'do': g:fzf_install }
Plug '/usr/local/opt/fzf' 
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'arcticicestudio/nord-vim'             " nord color scheme
" Plug 'mhartington/oceanic-next'
Plug 'jacekd/vim-iawriter', {'for': 'markdown'}
" Plug 'reedes/vim-colors-pencil'    " light/dark color scheme inspired by iA Writer
" Plug 'arzg/vim-corvine'         " very pretty dark colorscheme
" Plug 'lifepillar/vim-solarized8'
Plug 'rizzatti/dash.vim'		" search Dash.app docsets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'chr4/nginx.vim'			" improved nginx syntax highlighting
" Plug 'ctrlpvim/ctrlp.vim'		" fuzzy file finder
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'junegunn/vim-plug'		" to get vim help for vim-plug itself
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'          " make statusline awesome
Plug 'vim-airline/vim-airline-themes'   " themes for ^^awesome statusline
" Plug 'edkolev/tmuxline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-startify'                   " startup screen
" Plug 'davidhalter/jedi-vim'               " jedi for python
" Plug 'roxma/nvim-yarp'                      " dependency of ncm2
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim', {}
Plug 'plytophogy/vim-virtualenv'
" Plug 'godlygeek/tabular'		" for aligning text
" ___NERDTree__ "
"ch  Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()



" {{{ COLORSCHEME
    " if (has("termguicolors"))  " Suggestedfor OceanicNext
    "  set termguicolors
    " endif

    syntax enable
    :colorscheme nord

    " {{{ iAWriter
        " :colorschemeiawriter
        " set linespace=5
        " set background=light
        " set guifont=Cousine:h12
    " }}}
    "
    " {{{
        " TODO: See <https://github.com/reedes/vim-colors-pencil> for config
        " :colorscheme pencil
        " :set background=dark
        " :set background=light
    " }}}

    " {{{ OceanicNext
        " let g:oceanic_next_terminal_bold=1
        " let g:oceanic_next_terminal_italic=1
        " :colorscheme OceanicNext
    " }}}

    " {{{ Solarized8
        " :colorscheme solarized8
    " }}}

    " set background=dark	" Switch
    " set background=light	" Switch
" }}}



" {{{ AIRLINE
    let g:airline_detect_modified=1
    let g:airline_powerline_fonts = 1
    "
    let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#formatter = 'tail'
    " let g:airline#extensions#tmuxline#enabled = 1
    " let g:airline_theme='oceanicnext'
    " let g:airline_theme='base16_nord'
" }}}



" {{{ COC.NVIM
    " inoremap <expr> <Tab> pumvisible() ? \"\<C-n>" : \"\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? \"\<C-p>" :\"\<S-Tab>"

    " Map <tab> for trigger completion, completion confirm, snippet expand and jump
    " like VSCode. >

    inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    nmap <leader>crf <Plug>(coc-refactor)
    nmap <leader>cdef <Plug>(coc-definition)
    nmap <leader>cref <Plug>(coc-references)
    vmap <leader>cfs  <Plug>(coc-format-selected)
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " Shortcut for the :CocConfig command e.g.
    "     :C <enter> 
    function! SetupCommandAbbrs(from, to)
      exec 'cnoreabbrev <expr> '.a:from
            \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
            \ .'? ("'.a:to.'") : ("'.a:from.'"))'
    endfunction

    " Use C to open coc config
    call SetupCommandAbbrs('C', 'CocConfig')
    call SetupCommandAbbrs('Sn', 'CocCommand snippets.editSnippets')
" }}}



" {{{ BLACK
    nnoremap <F9> :Black<CR>
    " let g:black_fast=1                          " defaults to 0
    " let g:black_linelength=79                   " defaults to 88
    " let g:black_skip_string_normalization=1     " defaults to 0
    " let g:black_virtualenv                      " defaults to 
                                                  "   * ~/.local/share/nvim/black
                                                  "   * ~/.vim/black
" }}}


" {{{ NERDTREE
    let g:NERDTreeMouseMode = 2
    let g:NERDTreeMarkBookmarks = 1
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeWinPos = "left"	" Default
    " let g:NERDTreeWinSize = 31	" Default
    let g:NERDTreeMinimalUI = 0
    " Show NERDTree only when folder passed to nvim
    au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
    let g:NERDTreeHijackNetrw = 1
    nnoremap <leader>nt :NERDTreeToggle<CR>
    "nmap <leader>nt :NERDTreeToggle<CR>
    let g:NERDTreeIgnore = ['\.pyc$']
    " autocmd VimEnter * wincmd p 	" Jump to the main editor window.
    " autocmd VimEnter * NERDTree 	" Start NERDTree on nvim open
" }}}




" auto BufReadPost	*.sh	retab! 4
" auto BufWritePre	*.sh	retab! 8
" auto BufWritePost	*.sh	retab! 4
" auto BufNewFile		*.sh	set ts=4


" {{{ GENERAL_OPTIONS
    set encoding=utf-8	" for python3
    set wrap
    set number
    set showcmd			" Show (partial) command in status line.
    set mouse=a			" Enable mouse usage (all modes)
    set showmatch		" Show matching brackets.
    set ignorecase	" Do case insensitive matching
    set smartcase		" Do smart case matching
    " set incsearch		" Incremental search
    set autowrite		" Automatically save before commands like :next and :make
    set hidden			" Hide buffers when they are abandoned
" }}}


" {{{ LEADER
    let mapleader = ","
    let g:mapleader = ","
    " Fast saving
    nmap <leader>w :w!<cr>
    noremap <leader>q :qa<cr>
    " Alternate ESC
    inoremap jj <ESC>
    " Close current buffer
    nmap <leader>bd :bd %<CR>
    " Source init.vim
    nnoremap <leader>sx :source ~/.config/nvim/init.vim<CR>
" }}}


" Edit init.vim
command! -nargs=0 Edinit :tabe ~/.config/nvim/init.vim<CR>

" {{{ TextEditingHelpers
    " CursorKeybindings {{{
        " Insert newline above (SHIFT-CMD-ENTER)
        imap <S-D-CR> <ESC>O
        " Insert newline below, even when within a line (CMD-ENTER)
        imap <D-CR> <ESC>o
    " }}}
    "
    " KeyCodeHelpers{{{
        " ^ke -- 'escape'
        imap <C-k><C-e> <lt>ESC>  
        " ^kr -- 'return'
        imap <C-k><C-r> <lt>CR>
        " ^kl -- 'leader'
        imap <C-k><C-l> <lt>leader>
        " ^kc -- 'Ctrl-'
        imap <C-k><C-c> <lt>C- ><left>
    " }}}
" }}}

" Open the python, bpython interpreters
noremap <leader>py :tab terminal python3<CR> 
noremap <leader>bp :tab terminal bpython<CR>
" noremap <leader>py :!python<cr>inoremap 

nmap <silent> <leader>d <Plug>DashSearch



" {{{ WINDOWS
    " Window splits
    nmap <leader>wv <C-W>v                    " vsplit current window
    nmap <leader>ws <C-W>s                    " split current window

    " Moving windows
    nmap <leader>ww <C-W>w                    " Move cursor to another window (cycle)
    nmap <leader>wr <C-W>r                    " Rotate windows downwards/rightwards (CW)
    nmap <leader>wr <C-W>R                    " Rotate windows upwards/leftwards (CCW)

    " Window size
    nmap <leader>wz <C-W>_                    " [z]oom
                                              "     Max zoom current wind0w
    nmap <leader>w= <C-W>=                    " [=] (equals)
                                              "     All windows equal size
    nmap <leader>wph :resize +5<CR>           " [p]lus [h]eight : (5 lines taller)
                                              "   - [CTRL-W + | 5<C-W>+]
                                              "   - Increase window size by 10 lines
    nmap <leader>wpw :verticle resize +5<CR>  " [p]lus [w]idth : (CTRL-W > )
                                              "     Increase window size by 10 lines
    nmap <leader>wsv <C-W>L                   " [s]plit [v]ertical
                                              "     Move current window to far right (split => vsplit)
    nmap <leader>wsh <C-W>K                   " [s]plit [h]orizontal
                                              "     Move current window to top (vsplit => split)
    nmap <leader>wright <C-W>L                " Move current window to far right (split => vsplit)
    nmap <leader>wL<C-W>L                     " Move current window to far right (split => vsplit)
    nmap <leader>wtop <C-W>K                  " Move current window to top (vsplit => split)

    "Split Navigations
    nnoremap <C-J><C-J> <C-W><C-J>
    nnoremap <C-K><C-K> <C-W><C-K>
    nnoremap <C-L><C-L> <C-W><C-L>
    nnoremap <C-H><C-H> <C-W><C-H>
 
    " Set where splits occur
    set splitbelow
    set splitright

    " Don't redraw while executing macros (good performance config)
    set lazyredraw
" }}}



" ################################################

" {{{ MARKDOWN
    " {{{ GOYO
        let g:goyo_width=80
        " Using offsets in Goyo commands:
        "
        "   format -- [WIDTH][XOFFSET][x[HEIGHT][YOFFSET]]
        "
        "   Example commands:
        "     * Goyo 50%+25%x50%-25%
        "     * Goyo 50%+25%  " [w]=50% & 25% offset (from edge)
        "let g:goyo_height=75%
    " }}}
" }}}



" {{{ FOLDING
    set foldmethod=indent " Enable folding
    set foldlevel=99
    nnoremap <space> za
    let g:SimpylFold_docstring_preview=1
" }}}

" a function to execute formd and return the cursor back
" to it's original position within the buffer. 

" This script assumes formd is in your path at:
" ~/bin/formd/formd

" {{{ MANPAGE
    let g:ft_man_folding_enable=1
    " let g:man_hardwrap            Hard-wrap to $MANWIDTH. May improve layout.

    " To use Nvim as a manpager: >
    "      export MANPAGER='nvim +Man!'
" }}}

" ------- BufBakAsConfig Mappings ------- "
function! BufBakAsConfig()
    :python3<<EOF
from datetime import datetime, timedelta, tzinfo, timezone
from pathlib import Path
import pathlib_additions
import vim


def cb_to_esioconfig():
    bufpath: Path = Path(vim.current.buffer.name)
    dotbak: Path = Path(Path.home() / 'esioConfig/dotfiles/.config')
    db_dirs: set = set(sorted([d.name for d in dotbak.directories()]))
    est_offset = timedelta(hours=-5)
    est = timezone(est_offset)
    dt: datetime = datetime.now(est)
    if (par_name:=bufpath.parent.name) in db_dirs:
        dest = Path(
            dotbak / par_name / f"{bufpath.name}_{dt.strftime('%Y-%m-%dT%H-%M-%S%z')}"
        )
    else:
        newdir = Path(dotbak / par_name).mkdir(mode=0o777, parents=True)
        newdir = Path(dotbak / parname).mkdir(mode=0o777, parents=True)
        dest = Path(
            newdir.joinpath(f"{bufpath.name}_{dt.strftime('%Y-%m-%dT%H-%M-%S%z')}")
        )
    bufpath.copy(dest)

cb_to_esioconfig()
EOF
endfunction


" ---- BufBakAsConfig Mappings ---- 
nmap <leader>bb :call BufBakAsConfig()<CR>

function! PrependLineNo()
    :py3do if line: return f"{linenr:0>4d}: {line}"
    " :py3do if line: return "%4d: %s" % (linenr, line)
endfunction


function! Formd(option)
    :let save_view = winsaveview()
    :let flag = a:option
    :if flag == "-r"
        :%! ~/.bin/formd -r
    :elseif flag == "-i"
        :%! ~/bin/formd -i
    :else
        :%! ~/bin/formd -f
    :endif
    :call winrestview(save_view)
endfunction

" ---- formd mappings ---- "
nmap <leader>fr :call Formd("-r")<CR>
nmap <leader>fi :call Formd("-i")<CR>
nmap <leader>f :call Formd("-f")<CR>

" formd Markdown shortcuts
" nmap <leader>fr :%! formd -r<CR>
" nmap <leader>fi :%! formd -i<CR>


" ------- Filetype Autocommands ------- "


" defaults that can be overwridden below
set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=90
    \ expandtab
    \ autoindent
    \ fileformat=unix



au BufNewFile,BufRead *.py set
     \ tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=88
     \ expandtab
     \ autoindent
     \ fileformat=unix

" Auto blacken python files before write
autocmd BufWritePre *.py execute ':Black'

au Filetype python set
     \ tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=88
     \ expandtab
     \ autoindent
     \ fileformat=unix


" extraneous whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


au BufNewFile,BufRead *.yaml set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
    \ autoindent
    \ fileformat=unix

au Filetype yaml set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
    \ autoindent
    \ fileformat=unix


au BufNewFile,BufRead *.js,*.html,*.css set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab


au BufNewFile,BufRead *.md set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab


au BufNewFile,BufRead *.taskpaper,*.todo set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab


" Enable jsonc (sublime-style comments) compatability for linting
au FileType json syntax match Comment +\/\/.\+$+


" Automatically source init.vim on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END


" Path to your python executable
let g:python3_host_prog='/Users/esio/.pyenv/versions/3.8.0/bin/python3.8'  " Python 3
" let g:python_host_prog = '/usr/local/bin/python2'   " Python 2
