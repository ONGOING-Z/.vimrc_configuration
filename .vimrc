set number
" 显示匹配的括号
set showmatch

" 编码
"set encoding = 'utf-8'

" 搜索高亮
set hlsearch

" 如果一个文件中既包含 LINUX 也包含 linux，在开启智能大小写搜索功能时，如果使用 /LINUX 进行搜索，只有单词 LINUX 处会被搜到。反之，如果搜索 /linux，那么不论大小写的搜索结果都会被匹配
set ignorecase
set smartcase

" 语法高亮
syntax enable
syntax on

" Display extra whitespace
set list listchars=tab:»·,trail:·

" 将下列命令取消的原因：由于一些txt文件的每行都很长，将每行的长度限制了反而不容易查看
" Make it obvious where 100 characters is
set textwidth=80
set colorcolumn=+1

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

au BufNewFile,BufRead *.py
\ set tabstop=4   "tab宽度
\ set softtabstop=4 
\ set shiftwidth=4  
\ set textwidth=80  "行最大宽度
\ set colorcolumn=+1
\ set expandtab       "tab替换为空格键
\ set autoindent      "自动缩进
\ set fileformat=unix   "保存文件格式

" NERDTree 
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinPos="left"
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" Encoding open and close
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Vim-Plug
call plug#begin()
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Tagbar
Plug 'majutsushi/tagbar'

" 由于此插件太多庞大，一次安装并没有成功，未安装成功每次开启vim都会提示，就将之卸载
" YouCompleteMe
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" CSV
Plug 'chrisbra/csv.vim'

" Surroundings
Plug 'tpope/vim-surround'

" NERDTree
Plug 'scrooloose/nerdtree'

" 折叠
Plug 'tmhedberg/SimpylFold'

call plug#end()

" Statusline
"let g:syntastic_check_on_open = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"syntastic
"设置error和warning的标志 
let g:syntastic_enable_signs = 1 
let g:syntastic_error_symbol='✗' 
let g:syntastic_warning_symbol='►' 
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭 
let g:syntastic_auto_loc_list = 1 
"修改Locaton List窗口高度
"let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查 
let g:syntastic_check_on_open = 1 
"自动跳转到发现的第一个错误或警告处[not ok, 自动跳转很不好]
"let g:syntastic_auto_jump = 1
"进行实时检查，如果觉得卡顿，将下面的选项置为1 
let g:syntastic_check_on_wq = 0 
"高亮错误
let g:syntastic_enable_highlighting=1


" Tagbar
nmap <F8> : TagbarToggle<CR>
colorscheme gruvbox

" iab用于编辑模式，实现替换功能
" insert into now time
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xdate <c-r>=strftime("%Y-%m-%d %a %Y年%j天")<cr>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
