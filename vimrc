"==========================================
" Author: 徐基慧
" Email: aiplayx@gmail.com
" BlogPost: http://github.aiplay.io
" ReadMe: README.md
" Sections:
"       <基础设置>
"       <排版设置>
"       <文件编码设置>
"       <其它配置>
"       <自定义快捷键>
"       <文件类型设置>
"       <主题设置>
"==========================================

" 配置leader键
let mapleader = ','
let g:mapleader = ','
" let g:maplocalleader = '.'

" 开启语法高亮
syntax on

" 装载插件模块
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" ================== 基础设置 ==================

" 设置字体与字号大小
" set guifont=Monaco:h20

" 历史记录存储容量
set history=2000

"检测文件类型
filetype on

"针对不同的文件类型采用不同的缩进格式
filetype indent on

"允许插件
filetype plugin on

"启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread

" 启动的时候不显示那个援助索马里儿童的提示
" set shortmess=atI

" 取消备份
set nobackup

" 关闭交换文件
" set noswapfile

" 创建undo文件
" if has('persistent_undo')
  " set undolevels=1000         " How many undos
  " set undoreload=10000        " number of lines to save for undo
  " set undofile                " So is persistent undo ...
  " set undodir=/tmp/vimundo/
" endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 突出显示当前行等
" set cursorcolumn
set cursorline          " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕
" set t_ti= t_te=

" 键盘党不解释
set mouse-=a

" 设置选择区域与模式
" 指定在选择文本时，光标所在位置也属于被选中的范围
set selection=inclusive
set selectmode=mouse,key

" enable setting title
set title

set tm=500

" 去掉输入错误的提示声音
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set viminfo^=%

" 打开magic
set magic

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 解决复制粘贴代码错乱的问题
" function! WrapForTmux(s)
    " if !exists('$TMUX')
        " return a:s
    " endif
    " let tmux_start = "\<Esc>Ptmux;"
    " let tmux_end = "\<Esc>\\"
    " return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")
" function! XTermPasteBegin()
    " set pastetoggle=<Esc>[201~
    " set paste
    " return "
" endfunction
" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()]"]])]")

" 兼容tmux模式的cursor变换
" if exists('$TMUX')
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
    " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif



" ================== 展示排版 ==================

"显示当前的行号列号：
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 一直显示2行状态栏
set laststatus=2

"显示行号：
set number

" 取消换行。
set nowrap

" 括号配对情况,跳转并高亮一下匹配的括号
set showmatch

" 设置匹配时间
set matchtime=2

" 高亮search命中的文本。
set hlsearch

" 打开增量搜索模式,随着键入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase

" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 设置第80列为灰色
set colorcolumn=80
hi ColorColumn ctermbg=Gray

" 设置注释为灰色
" hi Comment ctermfg=LightGray

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=syntax
set foldlevel=99

" 代码折叠自定义快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
map <space> za
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
set smartindent
set autoindent

" tab相关变更
set tabstop=4     " 设置Tab键的宽度
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格
set shiftround    " 缩进时，取整

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" " 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>



" ================== 编码格式 ==================

" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set helplang=cn

" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

" 合并两行中文时，不在中间加空格：
set formatoptions+=B



" ================== 其他设置 ==================

" vimrc文件修改之后自动加载
autocmd! bufwritepost _vimrc source % " windows
autocmd! bufwritepost .vimrc source % " linux

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228))
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



" ================== 自定义快捷键  ==================

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
set pastetoggle=<F5>
" 离开插入模式后关闭粘贴模式
au InsertLeave * set nopaste

" F6 换行开关
nnoremap <F6> :set wrap! wrap?<CR>

" F7 语法开关，关闭语法可以加快大文件的展示
nnoremap <F7> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 用<F8>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == 1 && &number == 1)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set number
  endif
endfunc
nnoremap <F8> :call HideNumber()<CR>

" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 将光标移至行首
noremap H ^

" 将光标移至行尾
noremap L $

" 快速进入命令行
nnoremap ; :

" 设置快捷键将选中文本块复制至系统剪贴板
" vnoremap <Leader>y '+y'

" 命令行模式增强，ctrl-a到行首，ctrl-e到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 使用空格键进入搜索模式
" map <space> /
" nnoremap / /\v
" vnoremap / /\v

" 保证搜索内容在屏幕中央
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 交换#和*
" nnoremap # *
" nnoremap * #

" Python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" Tab 操作
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" Normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 跳转到上一个tab
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 复制到行尾
map Y y$

" 选择所有文本
map <Leader>sa ggVG"

" 选择代码块
nnoremap <leader>v V`}

" 强制保存
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>

" 滚动急速
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" 快速关闭当前窗口
nnoremap <leader>q :q<CR>

" 交换` 和 '
nnoremap ' `
nnoremap ` '

" 取消回退编辑操作
nnoremap U <C-r>

" 快速编辑vimrc文件
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" 快速装载vimrc文件
nmap <silent> <leader>sv :so $MYVIMRC<CR>



" ================== 文件类型设置  ==================

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,ruby,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
" autocmd BufNewFile *.h,*.cc,*.C,*.sh,*.py,*.rb exec ":call AutoSetFileHead()"

" 定义函数LastMod，自动保存修改文件时间
autocmd BufWritePre *.h,*.cc,*.C,*.sh,*.py,*.rb exec ":call LastMod()"

" 给.rb文件和.sh文件自动添加执行权限
autocmd BufWritePost *.sh,*.rb exec ":call SetExecutable()"

" 检查当前文件并设置可执行权限
function! SetExecutable()
  exe "silent !test -x ".expand("%")
  if v:shell_error
    exe "silent !chmod a+x ".expand("%")
  endif
endfunc

" 保存时，如果文件发生修改，自动保存时间
function! LastMod()
  if &modified
    let l:cursor_pos = getpos(".")
    let l:nlines = line("$") > 10 ? 10 : line("$")
    exe "1,".l:nlines."g/Last Modified: /s/Last Modified: .*/Last Modified: ".strftime("%c")
    call setpos('.', l:cursor_pos)
  endif
endfunc

" 注释
function! SetComment(n, sign)

    call setline(a:n, a:sign." *****************************************************************************")
    call setline(a:n+1, a:sign." File Name: ".expand("%:t"))
    call setline(a:n+2, a:sign." Author: Chuncheng Wei")
    call setline(a:n+3, a:sign." Mail: weicc1989@gmail.com")
    call setline(a:n+4, a:sign." Created Time : ".strftime("%c"))
    call setline(a:n+5, a:sign." Last Modified: ".strftime("%c"))
    call setline(a:n+6, a:sign." *****************************************************************************")
    call setline(a:n+7, "")
    return a:n+7
endfunc

" 插入文件头
function! AutoSetFileHead()

    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        let nend = SetComment(2, "\#")
        call setline(nend+1, "source /home/chwei/mc/bash/woformat/woformat.sh")
        call setline(nend+2, "")
        normal G
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# encoding: utf-8")
        let nend = SetComment(3, "\#")
        call setline(nend+1, "")
        normal G
    endif

    "如果文件类型为ruby
    if &filetype == 'ruby'
        call setline(1, "\#!/usr/bin/env ruby")
        call setline(2, "\# encoding: utf-8")
        let nend = SetComment(3, "\#")
        call setline(nend+1, "")
        normal G
    endif

     "如果文件类型为h
    if expand("%:e") == 'h'
        let nend = SetComment(1, "\/\/")
        call setline(nend+1, "\#ifndef _".toupper(expand("%:t:r"))."_H")
        call setline(nend+2, "\#define _".toupper(expand("%:t:r"))."_H")
        call setline(nend+3, "")
        call setline(nend+4, "\#endif")
        normal G
        normal k
    endif

     "如果文件类型为cc
    if expand("%:e") == 'cc'
        let nend = SetComment(1, "\/\/")
        call setline(nend+1, "\#include <iostream>")
        call setline(nend+2, "\#include \"".expand("%:t:r").".h\"")
        call setline(nend+3, "")
        call setline(nend+4, "")
        normal G
    endif

    "如果文件类型为C，用于Cern root脚本
    if expand("%:e") == 'C'
        let nend = SetComment(1, "\/\/")
        call setline(nend+1, "\/\/ this is a cern root script")
        call setline(nend+2, "void ".expand("%:t:r")."() {")
        call setline(nend+3, "  gInterpreter->ProcessLine(\".X /home/chwei/mc/root/gStyle/setstyle.C\");")
        call setline(nend+4, "")
        call setline(nend+5, "}")
        normal G
        normal k
    endif

endfunc

" 设置一些关键字为高亮
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif



" ================== 主题设置  ==================

" 在GUI模式下设置额外的选项
if has("gui_running")
    " set guifont=Consolas:h10
    " if has("gui_gtk2")   "GTK2
        " set guifont=Monaco\ 12,Monospace\ 12
    " endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 设置solarized主题
"set background=dark
"colorscheme solarized

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" 防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
