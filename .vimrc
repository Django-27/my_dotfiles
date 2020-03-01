
" Author: nfs_fly
" Create Date: 2020-2
" NOTE: Only use the config which you know its meaning.

"*****************************************************************************
" 插件管理
"*****************************************************************************
" 插件管理使用 Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle,required
    Plugin 'scrooloose/nerdtree'  " visually browse complex directory
    Plugin 'klen/python-mode'     " contains all you need to develop python applications in Vim
    Plugin 'Chiel92/vim-autoformat' " format code with one button press or on save
    Plugin 'w0rp/ale'             " syntax checking and semantic errors
    Plugin 'davidhalter/jedi-vim' " autocompletion library
    Plugin 'nvie/vim-flake8'      " a static syntax and style checker for Python source code
    Plugin 'jmcantrell/vim-virtualenv' " vim plugin for working with python virtualenvs
    Plugin 'ctrlpvim/ctrlp.vim'   " full path fuzzy file, buffer, mru, tag,... finder for Vim
    Plugin 'scrooloose/syntastic' " syntax checking plugin for Vim
    Plugin 'majutsushi/tagbar'    " browse the tags of the current file and get an overview of its structure
    Plugin 'raimondi/delimitmate' " automatic closing of quotes, parenthesis, brackets, etc
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'bronson/vim-trailing-whitespace' " whitespace highlight and delete
    Plugin 'scrooloose/nerdcommenter' " <leader>ci to comment and <leader>ci undo comment
    Plugin 'skywind3000/asyncrun.vim' " run shell command in background and output to quickfix
call vundle#end()
filetype plugin indent on

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

map <leader><space> :FixWhitespace<cr>

vmap <leader>fm :Autoformat<CR>>>

let g:ycm_key_list_select_completion=['<c-n>'] " 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_previous_completion=['<c-p>'] " 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_collect_indentifiers_from_tags_files=1 "开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1 " 从第1个键入字符就开始罗列匹配项,默认是第1个字符开始
let g:ycm_complete_in_comments = 1 " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1 " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_confirm_extra_conf=0 " 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串
let g:ycm_key_list_stop_completion = ['<C-y>'] " 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>>
nnoremap <leader>je :YcmCompleter GoToDefinitionElseDeclaration<CR>>
let g:ycm_python_binary_path = '/usr/local/bin/python3' " which python used
let g:ycm_global_ycm_extra_conf='/root/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸' " <C-w> + w 光标自动在左右侧窗口切换
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos='left'
let g:NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=0 " 目录树的增强,0表示默认不打开NERDTree, 支持tab键
let g:NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略显示的文件
let g:NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {"Modified": "✹", "Staged": "✚", "Untracked": "✭", "Renamed": "➜", "Unmerged": "═", "Deleted": "✖", "Dirty": "✗", "Clean": "✔︎", "Unknown": "?"} " 在NERDTree中显示git下信息
let NERDTreeHighlightCursorline=1 " 高亮鼠标所在的当前行

nmap <F3> :TagbarToggle<CR>
let g:tagbar_width = 30 " <C-w> + w 光标自动在左右侧窗口切换
let g:tagbar_left = 0
let g:tagbar_sort = 0 "设置标签不排序，默认排序
let g:tagbar_autofocus = 1 " 打开标签光标在标签栏，默认光标在文件内
let g:airline_powerline_fonts = 1
" let g:tagbar_autopreview = 1
let g:tagbar_ctags_bin = '/usr/bin/ctags'

let g:ctrlp_map = '<c-p>' " 查找文件
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$' " 设置过滤不进行查找的后缀名
let g:ctrlp_map = '<leader>p' " 设置开始文件搜索的快捷键
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$' " 设置默认忽略搜索的文件格式
let g:ctrlp_max_height=15 " 设置搜索时显示的搜索结果最大条数

let g:syntastic_check_on_open = 1 " 确保打开文件时Syntastic插件自动高亮显示错误
let g:syntastic_auto_jump = 1 " 打开或保存文件时跳到检测到的第一个错误处
let g:syntastic_always_populate_loc_list = 1 " 更新错误的底部显示

let g:virtualenv_directory = '/root/py_env'

"*****************************************************************************
" 基本设置
"*****************************************************************************
" 定义快捷键的前缀，即<Leader>, 默认是反斜杠 \
let mapleader=","

" 启动时不显示援助乌干达儿童的提示
set shortmess=atI
" 开启语法高亮功能
syntax enable
" 开启语法高亮
syntax on
" 关闭 vi 一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 去掉输入错误的提示声音
set noerrorbells
" 关闭使用可视响铃代替呼叫
set novisualbell
" 置空错误铃声的终端代码
set t_vb=

" 高亮显示当前行
set cursorline
" 总是显示光标位置
set ruler
"在状态栏显示正在输入的命令
set showcmd
" 命令行的高度
set cmdheight=2
" 总是显示状态栏
set laststatus=2
" 状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" <ESC> 键响应时间
set ttimeoutlen=0
" 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号
set showmatch
" 配对括号高亮时选中的括号显示黄色
hi MatchParen ctermbg=Yellow guibg=lightblue
" 允许光标出现在最后一个字符的后面
set virtualedit=block,onemore
" 光标键跨行
set whichwrap+=<,>,h,l

" 文件修改之后自动读入
set autoread
" 自动保存
set autowrite
" 退出 Vim 之后内容显示在终端屏幕
" set t_ti= t_te=
" 选择模式使用鼠标
set selectmode=mouse,key
" 共享剪贴板
" set clipboard^=unnamed
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard
    if has("unnamedplus") " mac X11 support
        set clipboard+=unnamedplus
    endif
endif

" 开启行号显示
set number
" 显示相对行号，便于 nj/nk 跳转
set relativenumber number
" 插入模式显示绝对行号，普通模式显示相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
" vim 打开文件，光标定位到上次退出的位置
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

" 置光标所在的行到屏幕的中央" 置光标所在的行到屏幕的中央, zt 、zz、zb
map <Tab> :bn<CR>zz
" 适合自己的 Esc
inoremap jj <Esc>:w<CR>


" 与系统剪贴板交互，ctrl+c, ctrl+v
" nmap <leader>v "+gp
" nmap <leader>c "+y
" nmap <leader>s :w<CR>

" 定义快捷键在结对符之间跳转,默认就是 % 跳转
" nmap <Leader>M %>

" 快速导航拆分面板
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" 自动补全 <
inoremap < <><Esc>i

"从新定义<Home>键,跳到非空格行首
map <Home> ^
imap <Home> <Esc>^i

"*****************************************************************************
" 主题设置
"*****************************************************************************
" GUI 模式浅色背景，终端模式深色背景
if has('gui_running')
    set background=light
else
    set background=dark
endif

" 主题设置为solarized8在.vim/pack
set background=dark
colorscheme solarized8

" 暂时没有起作用，但是屏蔽了80列的红色突出显示
set colorcolumn=80,100
highlight colorcolumn ctermbg=227

"*****************************************************************************
" 编码设置
"*****************************************************************************
" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8
" Vim 所工作的终端的字符编码方式
set termencoding=utf-8
" Vim 内部使用的字符编码方式
set encoding=utf8
" Vim 启动时会按照 fileencodings 所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，
" 并且将 fileencoding 设置为最终探测到的字符编码方式
set fileencodings=ucs-bom,utf8,gbk,cp936,gb2312,gb18030
" 文件输入输出使用的格式，默认为 UNIX 格式
set fileformats=unix,dos

" 代码折叠
set foldmethod=indent   "代码折叠
set foldlevel=99
nnoremap <space> za
"*****************************************************************************
" 搜索配置
"*****************************************************************************
" 高亮显示搜索结果
set hlsearch
" 输入搜索时，同时高亮部分的匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时尝试smart，即模式中有大写字母时不忽略大小写
set smartcase

"*****************************************************************************
" 缓存配置
"*****************************************************************************

" 历史记录条数
set history=2000
" 不备份
set nobackup
" 禁止生成临时文件
set noswapfile
" 文件在 vim 之外修改过，自动重新读入
set autoread
" 自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 创建撤销文件, 在关闭文件后再次打开时还可以撤销上次的更改
if v:version >= 730
    set undofile                   " 把撤销信息写入一个文件里
    set undodir=~/.vim/vim_undo/   " 撤销文件的保存位置
endif
" 最多可以撤销的改变个数
set undolevels=1000
" 保存缓冲区重载撤销的最大行数(number of lines to save for undo)
set undoreload=10000

"*****************************************************************************
" 代码排版
"*****************************************************************************

" 自适应不同语言的智能缩进
filetype indent on
" 开启文件类型侦测
filetype on
" " 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自动缩进
set autoindent
" 使用 C/C++ 语言的自动缩进方式
set cindent
" C/C++ 语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能选择对齐方式
set smartindent
" 当一行字符超过窗口宽度时，禁止换行显示
set nowrap
" 当打开换行显示时，在空格处换行
set linebreak

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 打开断行模块对亚洲语言支持
" m 表示允许在两个汉字之间断行， 即使汉字之间没有出现空格
" B 表示将两行合并为一行的时候， 汉字与汉字之间不要补空格
set formatoptions+=mB
" <Tab> 占用空格数
set tabstop=4
" 编辑时 <Tab> 占用的空格数
set softtabstop=4
" 自动缩进时步进的空格数
set shiftwidth=4
" 插入 <Tab> 时使用 ‘shiftwidth’
set smarttab
" 缩进列数对齐到 shiftwidth 的整数倍
set shiftround
" 用空格替换 <Tab>
set expandtab
" 使用 <Backspace> 正常处理indent,eol,start等
set backspace=2

" 横向滚动的最少列数
set sidescroll=10
" 光标离窗口上下边界 5 行时窗口自动滚动
set scrolloff=5

" 变更 <Tab> 和空格的显示方式为 >- 和 -
:set listchars=tab:>-,trail:-,space:.
" 显示行尾空格，标记为红色
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 字符之间的像素行数
set linespace=0

" tabe 之间的切换, 加快gt的速度
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-0> :tablast<CR>

"*************************************************************************
" 新建.py文件
"*************************************************************************
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

function! InsertPyHeader()
    execute "normal! i# -*- coding: utf8 -*-"
    execute "normal! ofrom __future__ import print_function"
    execute "normal! Go"
    execute "normal! Go"
    execute "normal! Goif __name__ == '__main__':"
    execute "normal! Gopass"
    normal! kk
endfunction
autocmd BufNewFile *.py call InsertPyHeader()

"********************************************************************************
" 键盘F2-F4、 F7-F9配置
"********************************************************************************
" <F2> 打开/关闭 NERDTreeToggle 文件目录
" <F3> 打开/关闭 TagbarToggle   标签目录

" <F4> 打开/关闭行号显示
nnoremap <F4> :call NumberToggle()<CR>
function! NumberToggle()
    if (&relativenumber == &number)
        set relativenumber! number!
    elseif (&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc

" Ctrl-n 打开/关闭相对行号显示
nnoremap <C-n> :call RelativenumberToggle()<CR>
function RelativenumberToggle()
    if (&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc

" <F7> 打开/关闭自动换行
nnoremap <F7> :set wrap! wrap?<CR>

" <F8> 打开/关闭鼠标功能
nnoremap <F8> :call MouseToggle()<CR>
" 鼠标功能开关函数
function! MouseToggle()
"    if empty(&mouse)
    if (&mouse == 'a')
        set mouse=v
    else
        set mouse=a
    endif
endfunc

" <F9> 打开/关闭空格替换<Tab>
nnoremap <F9> :set expandtab! expandtab?<CR>

" 把 <Tab> 替换成 4 个空格
nnoremap tt :%s/\t/    /g<CR>
" 删除行尾多余空格
nnoremap cl :%s/\s\+$//g<CR>:w<CR

"********************************************************************************
" 编译、调试
"********************************************************************************
" <F5> 编译运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"">>"
    elseif &filetype == 'python'
        exec "!time python3 %"
        " exec "AsyncRun! time python3 %"
    endif
endfunc

" <F6 添加ipdb调试
nnoremap <leader>ip oimport ipdb;ipdb.set_trace()
" func s:RunIpdb()
    " if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en endf
" endfunc

" func! s:SetBreakpoint()
    " cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
" endfunc

" func! s:RemoveBreakpoint()
    " exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
" endfunc
" map <F6> :call <SID>RunIpdb()<CR>

func! s:SetBreakpoint()
        cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
noremap <F6> :call <SID>ToggleBreakpoint()<CR>
