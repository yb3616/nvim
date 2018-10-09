call plug#begin('~/.local/share/nvim/plugged')

"     插件
" 自动补全框架：DEOPLETE
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

"     插件
" 自动补全插件：GO
Plug 'zchee/deoplete-go', { 'do': 'make'}

"     插件
" 自动补全插件：PHP
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"     插件
" 自动补全插件：JAVASCRIPT
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

"     插件
" 自动补全插件：PYTHON
Plug 'zchee/deoplete-jedi'

"     插件
" 格式化代码插件
Plug 'chiel92/vim-autoformat'

"     插件
" 主题样式和语法高亮
"Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'

"     插件
" 参数补全 与括号自动补全插件冲突
"Plug 'tenfyzhong/CompleteParameter.vim'

"     插件
" 括号等自动补全插件
Plug 'jiangmiao/auto-pairs'

"     插件
" Airline
Plug 'vim-airline/vim-airline'

"     插件
" 文件树
Plug 'scrooloose/nerdtree'

"     插件
" HTML
Plug 'mattn/emmet-vim'
Plug 'valloric/matchtagalways'
Plug 'posva/vim-vue'

"     插件
" 错误提示
Plug 'w0rp/ale'

"     插件
" 函数跳转
Plug 'jsfaint/gen_tags.vim'

"     插件
" 缩进线
Plug 'yggdroot/indentline'

call plug#end()

"     配置
" DEOPLETE
let g:deoplete#enable_at_startup = 1

"     配置
" 参数补全
"let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"     配置
" HTML
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'vue' : 1 }

let g:gen_tags#gtags_default_map = 1

"     配置
" 主题
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
colorscheme badwolf

"     配置
" 文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinPos=1
map <C-n> :NERDTreeToggle<CR>

"     配置
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"     配置
" PHPCD
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

"     配置
" Autoformat
noremap <F3> :Autoformat<CR>

"     配置
" 基本配置
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
set completeopt=menu,preview

au BufReadPost * exe "normal! g`\""

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
