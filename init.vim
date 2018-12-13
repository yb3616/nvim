call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  "     插件
  " 自动补全框架：NCM2
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c

  "     插件
  " 自动补全插件：PHP
  Plug 'phpactor/phpactor', { 'branch': 'develop', 'do': 'composer install', 'for': 'php' }
  Plug 'phpactor/ncm2-phpactor'
  autocmd BufEnter * call ncm2#enable_for_buffer()

  "     插件
  " 自动补全插件：GOLANG
  Plug 'ncm2/ncm2-go'
endif

"     插件
" 格式化代码插件
Plug 'chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>

"     插件
" 主题样式和语法高亮
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 0
let g:badwolf_html_link_underline = 0
let g:badwolf_css_props_highlight = 1

"     插件
" Airline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"     插件
" 文件树
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinPos=1
map <C-n> :NERDTreeToggle<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>
map <C-j> :bl<CR>
map <C-k> :bf<CR>

" HTML
Plug 'mattn/emmet-vim'
Plug 'valloric/matchtagalways'
Plug 'posva/vim-vue'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'vue' : 1 }

"     插件
" 错误提示
Plug 'w0rp/ale'
let g:ale_lint_on_enter = 0               " 打开文件不检查
let g:ale_lint_on_text_changed = 'never'  " 修改文件不检查

"     插件
" 函数跳转
Plug 'jsfaint/gen_tags.vim'
Plug 'ncm2/ncm2-gtags'
let g:gen_tags#gtags_default_map = 1

"     插件
" 缩进线
Plug 'yggdroot/indentline'

"     插件
" 括号等自动补全插件
Plug 'jiangmiao/auto-pairs'

call plug#end()

"     配置
" 基本配置
colorscheme badwolf
set number
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set history=1000
set nobackup
set noswapfile
set noundofile
set ignorecase
set hlsearch
set incsearch
set autoread
set noeb
set mouse=a
set showmatch
set matchtime=1

au BufReadPost * exe "normal! g`\""

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
