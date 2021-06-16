" Be iMproved, (also required for Vundle)
set nocompatible

"##############################################################################

"---------------------------------------
" LOAD INTERNAL PLUGINS

packadd termdebug

"---------------------------------------
" LOAD EXTERNAL PLUGINS

" Disable filetype, set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'lifepillar/vim-solarized8' " solarized theme

Plugin 'vim-airline/vim-airline' " Better tab bar and status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive' " Show git branch in airline

Plugin 'Valloric/YouCompleteMe' " C/C++/Python/... code completion and error highlighting
Plugin 'habamax/vim-asciidoctor' " Better Asciidoc support
Plugin 'sheerun/vim-polyglot' " Better syntax highlighting

Plugin 'scrooloose/nerdtree' " A filetree
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'rhysd/vim-clang-format' " Clang-Format support
Plugin 'tell-k/vim-autopep8' " Python autopep support
Plugin 'tell-k/vim-autoflake' " Python autoflake support

Plugin 'airblade/vim-gitgutter' " Display changes via git

Plugin 'airblade/vim-rooter' " Set working directory to project root (.vimrc)
Plugin 'krisajenkins/vim-projectlocal' " Use project local vimrc

"Plugin 'mthiede/rtext-vim-plugin' " Support for rtext files

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzyfind
Plugin 'junegunn/fzf.vim'

Plugin 'ryanoasis/vim-devicons' " Nice Icons

call vundle#end()
filetype plugin indent on

source /home/devel/.ycm/lsp-examples/vimrc.generated

"##############################################################################

"---------------------------------------
" Enable project specific vimrc configurations
" set exrc
" set secure

"---------------------------------------
" Enable dracula theme correctly
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme solarized8

"---------------------------------------
" Allow hidden buffers
set hidden

"---------------------------------------
" Disable search highlighting by default
set nohlsearch

"---------------------------------------
" Enable syntax highlighting by default
syntax on

"---------------------------------------
" Remap the leader key
let mapleader=" "
set timeout timeoutlen=1500

"---------------------------------------
" Enable mouse
set mouse=a

"--------------------------------------
" Use the system clipboard
set clipboard=unnamed

"--------------------------------------
" Disable automatic linebreak and linewrap
set textwidth=0
set wrap!

"---------------------------------------
" Show hidden chars like tabs and linebreaks
set list
set showbreak=↪\
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ ",eol:↲

"---------------------------------------
" Enable highlighting of current line
set cursorline

"---------------------------------------
" Always show the sign column
set signcolumn=yes

"---------------------------------------
" Always show the line numbers
set number

"---------------------------------------
" Always show the cursor position
set ruler

"---------------------------------------
" Allow backspace to delete over linebreaks and more in insert mode
set backspace=indent,eol,start

"---------------------------------------
" Enable menu for suggestions in statusline
set wildmenu

"---------------------------------------
" Nicer autocomplete menu
set completeopt=longest,menuone,popup
set completepopup=border:off,highlight:Pmenu

"---------------------------------------
" Make Termdebug split horizontally if the window size is wide enough
let g:termdebug_wide=163

"---------------------------------------
" Insert two spaces whenever tab is used
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

"---------------------------------------
" Allow syntax highlighting to take up to 10 seconds
set redrawtime=10000

"##############################################################################

"---------------------------------------
" Add doxygen on top of c/c++
autocmd FileType c set syntax=c.doxygen
autocmd FileType cpp set syntax=cpp.doxygen

"---------------------------------------
" Help filetype detection
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.conf set filetype=conf " Overrule vim-bitbake
autocmd BufNewFile,BufReadPost .vimrc set filetype=vim
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
autocmd BufNewFile,BufReadPost *.rtext set filetype=rtext
autocmd BufNewFile,BufReadPost *.som set filetype=rtext
autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy

"##############################################################################

"---------------------------------------
" Configure YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'tagbar' : 1,'nerdtree' : 1}
let g:ycm_auto_hover=''
let g:ycm_use_clangd=1
let g:ycm_clangd_args=['--clang-tidy',
                      \'--completion-style=detailed',
                      \'--header-insertion=never',
                      \'--suggest-missing-includes',
                      \'--background-index']
let g:ycm_semantic_triggers = {'cpp' : ['re!.'],'c++' : ['re!.']}
autocmd BufRead,BufNewFile /usr/include/* set ft=c
autocmd BufRead,BufNewFile /usr/include/c++/* set ft=cpp

"---------------------------------------
" Configure vim-Asciidoctor
let g:asciidoctor_syntax_conceal = 1
let g:asciidoctor_fenced_languages = ['python', 'c', 'cpp', 'javascript', 'bash']


"---------------------------------------
" Configure Airline
let g:airline_powerline_fonts=1
"let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#show_buffers=1
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

"---------------------------------------
" Configure cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"---------------------------------------
" Configure NERDTree
let NERDTreeStatusline="NERDTree"
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
function _NERDTreeToggleFind()
    if bufname('') == ''
        :NERDTreeToggle
    elseif &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
command NERDTreeToggleFind :call _NERDTreeToggleFind()
let NERDTreeGitStatusPorcelainVersion=1

"---------------------------------------
" Configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_winsize=15

"---------------------------------------
" Configure AutoFormatter for C++ and Protobuf
let g:clang_format#command = "/usr/bin/clang-format"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 0
let g:clang_format#auto_formatexpr = 1
let g:clang_format#enable_fallback_style = 1
let g:clang_format#fallback_style = "None"

"---------------------------------------
" Configure AutoFormatter for Python
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 0
let g:autoflake_disable_show_diff = 1
let g:autoflake_on_save = 0


"---------------------------------------
" Configure GitGutter
let g:gitgutter_terminal_reports_focus = 1
set updatetime=100
sign define dummy
execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

"---------------------------------------
" Configure VimRooter
let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_targets = '/,*'
let g:rooter_patterns = ['.vimrc']

"---------------------------------------
" Configure VimRooter
let g:projectlocal_project_markers = ['.vimrc', '.git']

"---------------------------------------
" Configure TermDebug
:command Watch -nargs=+ :call TermDebugSendCommand('watch '.<q-args>)

"##############################################################################

"--------------------------------------
" Keymappings for buffers
nnoremap <C-n>       :enew    <CR>
nnoremap <Leader>q   :bp\|bd #<CR>
nnoremap <A-Left>    :bprev   <CR>
nnoremap <A-Right>   :bnext   <CR>

"--------------------------------------
" Keymappings for highlighting toggles
nnoremap <silent> <F1> :set spell!<CR>
nnoremap <silent> <F2> :set hlsearch!<CR>
nnoremap <silent> <F3> :set hlsearch<CR>/<C-r><C-w><CR><S-n>
nnoremap <silent> <F4> :if exists("g:syntax_on") \| syntax off \| else \| syntax on \| endif<CR>

"--------------------------------------
" Keymappings for fzf
nnoremap <C-f> :Files<CR>
nnoremap <C-t> :Tags<CR>

"---------------------------------------
" Key bindings for TermDebug
nnoremap <F5> :Run<CR>
nnoremap <F6> :Step<CR>
nnoremap <F7> :Continue<CR>
nnoremap <F8> :Stop<CR>

"---------------------------------------
" Key bindings for TermDebug
nnoremap <F12>   :YcmCompleter GoTo<CR>
nnoremap <S-F12> :YcmCompleter GoToReferences<CR>
nnoremap <F9>    :YcmCompleter FixIt<CR>
nnoremap <S-F9>  :YcmCompleter RefactorRename <C-r><C-w>

"---------------------------------------
" Key bindings for NERDTree
nnoremap <Leader>n :NERDTreeToggleFind<CR>

"##############################################################################


