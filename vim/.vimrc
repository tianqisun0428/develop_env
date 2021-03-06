" set the runtime path to include Vundle and initialize
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
""-------------------------start 插件安装-------------------
"let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
"代码片段补全
"Bundle 'drmingdrmer/xptemplate'
"切换函数列表的开、关
Bundle 'Valloric/ListToggle'
"自动补全插件
Bundle 'Valloric/YouCompleteMe'
"显示git差异的
Bundle 'airblade/vim-gitgutter'
"显示差异.尤其是merge时好用
Bundle 'tpope/vim-fugitive'
"自动生成ctags
Bundle 'ludovicchabant/vim-gutentags'
"显示历史文件列表
Bundle 'jlanzarotta/bufexplorer'
"可以将正在编辑的文件生成一个大纲, 包含类/方法/变量等, 可以选中快速跳转到目标位置
Bundle 'tabbar'
"通过创建一个侧边栏来显示当前文件的ctags生成的标签
Bundle 'majutsushi/tagbar'
"允许在源文件之间快速轻松地切换
Bundle 'a.vim'
"文件名搜索插件
Bundle 'ctrlp.vim'
"跨文件查找
Bundle 'rking/ag.vim'
"显示窗口底部状态条
Bundle 'bling/vim-airline'
"vim 搜索插件
Bundle 'dyng/ctrlsf.vim'
"必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
"NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'
"vim 主题插件
Bundle 'joshdick/onedark.vim'
"自动生成函数注释
Bundle 'DoxygenToolkit.vim'
"成对插入或删除括号，parens，引号。
Bundle 'jiangmiao/auto-pairs'
"markdown插件，顺序是tabular要在vim-markdown之前
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"toml文件格式
Bundle 'cespare/vim-toml'
"Bundle 'SirVer/ultisnips'
"编写HTML插件
Bundle 'gcmt/breeze.vim'
"编写HTML, 凸显匹配插件
Bundle 'gregsexton/MatchTag'
"自动补全html的关闭标签, 如<table>|</table>
Bundle 'docunext/closetag.vim'
"快速格式化javascript，html和css文件
Bundle 'maksimr/vim-jsbeautify'
"vim 颜色
Bundle 'Rykka/colorv.vim'
"每个缩进级别显示用空格缩进的细垂直线 |
Bundle 'Yggdroot/indentLine'
"Bundle 'mattn/emmet-vim'
"Vue组件的 Vim语法高亮显示
Bundle 'posva/vim-vue'
"提供基于Tern的JavaScript编辑支持
Bundle 'marijnh/tern_for_vim'
"UML图表的“实时预览
"Bundle 'scrooloose/vim-slumlord'
"palntuml语法插件
"Bundle 'aklt/plantuml-syntax'
"autopep8用于代码按PEP8规范格式化
Bundle 'tell-k/vim-autopep8'
"jedi用于代码自动补全, 定义跳转 
Plugin 'davidhalter/jedi-vim'
"flake8用于代码检查
Plugin 'nvie/vim-flake8'
"pep8-indent用于自动缩进
Plugin 'Vimjas/vim-python-pep8-indent'
"异步运行shell命令，并在同框中显示
Plugin 'skywind3000/asyncrun.vim'
"无干扰写作, 专注模式
Plugin 'junegunn/goyo.vim'
""-------------------------end 插件安装-------------------


"-------------------------start 一些快捷键设置-------------------
"粘贴模式切换，防止有格式粘贴代码，因自动缩进混乱的情况
set pastetoggle=<F2>

"行号显示开关
nnoremap <F3> :set nonumber! number?<CR>

"目录展开与关闭
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"切换函数列表的开、关
nnoremap <silent> <F5> :TagbarToggle<CR>

"lvim 的窗口本地列表跳转命令为 :lnext 、 :lprev 、 :lfirst 及 :llast 
nmap <F6> :lnext<cr>

nmap <F7> :lprevious<cr>

"在可用的情况下，尝试更改缓冲区以纠正当前行上的诊断错误或警告。如果有多个建议可用，则会显示选项并可以选择一个。
"map <F9> :YcmCompleter FixIt<CR>

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>

nnoremap <silent> <F11> :UndotreeToggle<CR>

"头文件与源文件的切换
nnoremap <silent> <F12> :A<CR>

"跨文件复制命令
vmap <leader>y :w! ~/.vbuf<cr>
nmap <leader>y :.w! ~/.vbuf<cr>
"将内容追加到临时文件末尾
vmap <leader>Y :w! >> ~/.vbuf<cr>
nmap <leader>Y :.w! >> ~/.vbuf<cr>
"粘贴~/.vbuf的内容到当前光标下
nmap <leader>tt :r ~/.vbuf<cr>

"""行号显示与取消快捷键
"nmap <Leader>so :set nonu <Esc>:NERDTreeClose <cr>
"nmap <Leader>sn :set nu <cr>""

"生成函数头注释
nnoremap <leader>dg :Dox

map <C-l> :BufExplorer<CR>

"cscope的快捷键设置, CTRL+\, 然后按‘s’，即为对应的命令:cs f s [symbol]
    "s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
    "g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
    "d: 查找本函数调用的函数
    "c: 查找调用本函数的函数
    "t: 查找指定的字符串
    "e: 查找egrep模式，相当于egrep功能，但查找速度快多了
    "f: 查找并打开文件，类似vim的find功能
    "i: 查找包含本文件的文件
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"YcmCompleter
"在可用的情况下，尝试更改缓冲区以纠正当前行上的诊断错误或警告。如果有多个建议可用，则会显示选项并可以选择一个。
"map <F9> :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToImprecise<CR>
"-------------------------end 一些快捷键设置-------------------


"-------------------------start 一些特征设置-------------------
"Set default encoding to UTF-8
set encoding=utf-8 
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set foldmethod=indent
"设置语法高亮
syntax enable
syntax on
"主题色
colorscheme onedark
let g:onedark_termcolors=256
let g:enable_bold_font=1
vmap <C-c> "+y
"开启鼠标
set mouse=a
"开启行号显示
set number
"突出显示当前行
set cursorline
"打开状态栏标尺
set ruler 
"以下三个配置配合使用，设置tab和缩进空格数
set expandtab               
set shiftwidth=4
set tabstop=4
"设置在insert模式下，backspace无法删除的问题
set backspace=indent,eol,start

"gvim字体设置
set guifont=Fira\ Mono\ Medium\ 14
set guifontwide=Kai\ Ti\ 15
"隐藏gvim右边的滚动栏
set guioptions-=r
set guioptions-=T
set guioptions-=m
"隐藏gvim左边的滚动栏
set guioptions-=L
"就是让 vim 关闭所有扩展的功能，尽量模拟 vi 的行为
"set nocompatible
"该命令指定让 Vim 工作在不兼容模式下
set nocp
"去掉输入错误的提示声音
set noeb
"关闭gvim声音
set visualbell t_vb=  "关闭visual bell
au GuiEnter * set t_vb= "关闭beep
"设置补全
     ". 扫描当前缓冲区 (忽略 'wrapscan')
     "w 扫描其它窗口的缓冲区
     "b 扫描其它缓冲区列表里载入的缓冲区
set cpt=.,w,b
filetype off                  " required
filetype plugin indent on
"设置自从缩进
set autoindent
set cindent
set cinoptions={0,:0,g0,l1,t0,(0)}
set completeopt=longest,menu
set hlsearch
set incsearch
"忽略大小写
"set ignorecase
set textwidth=120
set cc=120
"总显示最后一个窗口的状态行；
    "设为1则窗口数多于一个的时候显示最后一个窗口的状态行； "0不显示最后一个窗口的状态行
set laststatus=2
"imap空格映射的标志位，表示F9的控制标志位, 初始设置为1，对于非代码文件是不映射的
let g:equ=1
"-------------------------end 一些特征设置-------------------

"---------------------------start 启动时文件检测----------------------------
"自动执行文本缩进
autocmd  FileType *.php,*.js,*.cc,*.h,*.c,*cpp,*hpp exec ":call SetimapFunc()"
"---------------------------end 启动时文件检测----------------------------

"-------------------------start 根据文件后缀添加相应的头部注释-------------------
"SET Comment START
"autocmd BufNewFile *.php,*.js,*.cc,*.h,*.c,*cpp,*hpp exec ":call SetComment()" | exec ":call SetimapFuncCtl()"  |normal 10Go
autocmd BufNewFile *.php,*.js,*.cc,*.h,*.c,*cpp,*hpp exec ":call SetComment()"
func SetComment()
    if expand("%:e") == 'php'
        call setline(1, "<?php")
    elseif expand("%:e") == 'js'
        call setline(1, '//JavaScript file')
    elseif expand("%:e") == 'cc'
        call setline(1, '//C++ file')
    elseif expand("%:e") == 'h'
        call setline(1, '//头文件 file')
    elseif expand("%:e") == 'c'
        call setline(1, '//c file')
    endif
    call append(1, '//***********************************************')
    call append(2, '//      Filename: '.expand("%"))
    call append(3, '//        Author: lgy ')
    call append(4, '//   Description: ---')
    call append(5, '//        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(6, '// Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(7, '//***********************************************')
"    call append(10, '')
endfunc
"SET Comment END"
"
"SET PythonComment START
autocmd BufNewFile *py exec ":call SetPythonComment()" | exec ":call SetimapFuncCtl()"  |normal 10Go
func SetPythonComment()
    if expand("%:e") == 'py'
        call setline(1, '# python file')
    endif
    call append(1, '# ***********************************************')
    call append(2, '#       Filename: '.expand("%"))
    call append(3, '#         Author: lgy ')
    call append(4, '#    Description: ---')
    call append(5, '#         Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(6, '#  Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(7, '# ***********************************************')
"    call append(10, '')
endfunc
"SET PythonComment END"
"-------------------------end "根据文件后缀添加相应的头部注释-------------------


"--------------------start vim man.vim的配置-------------
run ftplugin/man.vim
if has('gui_running')
nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
else
set t_Co=256
endif
"--------------------end vim man.vim的配置-------------


"-------------------------start 按F9一键编译并运行-------------------
"map <F9> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"        exec "w"
"        if &filetype == 'c'
"           exec "!g++ % -DLOCAL -o   %<"
"           exec "!time ./%<"
"        elseif &filetype == 'cpp'
"           exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o    %<"
"           exec "!time ./%<"
"        elseif &filetype == 'java'
"           exec "!javac %"
"           exec "!time java %<"
"        elseif &filetype == 'sh'
"           :!time bash %
"        elseif &filetype == 'python'
"        exec "!time python3 %"
"        endif
"    endfunc  
"-------------------------end 按F9一键编译并运行-------------------


""-------------------------start YouCompleteMe-------------------
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui  =  0                  "关闭语法提示
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"set error or warning signs
let g:ycm_error_symbol='e>'
let g:ycm_warning_symbol='w>'
let g:ycm_semantic_triggers={
        \   'c':['->','.'],
        \   'objc':['->','.'],
        \   'cpp,objcpp': ['->','.','::'],
        \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
        \   'html':['<','"','</CR>','''"'],
        \   'vim':['re![_a-za-z]+[_\w]*\.'],
        \   'ruby':['.','::'],
        \   'css':['re!^\s{2, 4}','re!:\s+'],
        \   'javascript':['.','re!(?=[a-zA-Z]{3,4})'],
        \   'vue':['.','re!(?=[a-zA-Z]{3,4})'],
        \ }

let g:ycm_always_populate_location_list=1
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_cache_omnifunc=0
let g:ycm_python_binary_path='/usr/bin/python3'

" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0

"加载ctags的字符
let g:ycm_collect_identifiers_from_tags_files = 1

""-------------------------end YcmCompleter-------------------


""-------------------------start DoxygenToolkit生成注释-------------------
let g:DoxygenToolkit_authorName=""
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

""-------------------------end DoxygenToolkit-------------------

"-------------------------start gutentags-------------------
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"-------------------------end gutentags-------------------


""-------------------------start cscope-------------------
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/")
        if !empty(cscope_file)&&filereadable(cscope_file)
            exe "cs add" cscope_file  cscope_pre
        endif
    endif
endif

"-------------------------end cscope-------------------


"-------------------------start tagbar-------------------
"let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
let g:tagbar_width=30
let g:tagbar_left=1
"-------------------------end tagbar-------------------


"----------------------start indentLine缩进对齐线的插件---------------------------
let g:indentLine_char="|"
let g:indentLine_enabled=0 "开启与关闭，开是1，关是0
let g:indentLine_char='¦' 
let g:indentLine_showFirstIndentLevel  =  1
let g:indentLine_color_term  =         000
"----------------------start indentLine缩进对齐线的插件---------------------------


"------------------------------- start 设置= + - * 前后自动空格-------------------

function! EqualSign(char)
let ex1 = getline('.')[col('.') - 3]
let ex2 = getline('.')[col('.') - 2]
let ex3 = col('.')

if ex1 =~ "[=+><>\/\]"
    if ex2 !~ "/s"
        return "\<ESC>i".a:char."\<SPACE>"
    else
        return "\<ESC>xa".a:char."\<SPACE>"
    endif
else
    if ex2 !~ "/s"
        return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
    else
        return a:char."\<SPACE>\<ESC>a"
        "return ex3
    endif
endif
endf
"------------------------------- end 设置= + - * 前后自动空格-------------------


"-------------------------start 撤销通过方向键移动光标-----------------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop> 
"-------------------------end 撤销通过方向键移动光标-----------------


"-------------------------start asyncrun----------------
" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 10
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
"-------------------------end asyncrun----------------


"-----------------------start 对NERD的设置------------------------
let NERDShutUp=1
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
"-----------------------end 对NERD的设置------------------------


"---------------------start autopep8用于代码按PEP8规范格式化
autocmd FileType python map <F6> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
let mp=&makeprg
let ef=&errorformat
let exeFile=expand("%:t")
setlocal makeprg=/usr/bin/python3\ -u
set efm=%C\ %.%#,#A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
silent make %
copen
let &makeprg=mp
let &errorformat=ef
endfunction

let g:autopep8_disable_show_diff=1
"using flake8 as a python syntax checker
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'

let g:autopep8_aggressive=2

let g:plantuml_executable_script="~/.mkuml.sh"

let g:pymode_python = 'python3'
autocmd VimEnter *.py python3 sys.path.append('.')
autocmd BufWritePost *.py call Flake8()
"自动跳转上次退出的位置
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"---------------------start autopep8用于代码按PEP8规范格式化


"---------------------start jedi用于代码自动补全, 定义跳转--------------
"let g:jedi#force_py_version=3
"let g:jedi#smart_auto_mappings = 0
"---------------------start jedi用于代码自动补全, 定义跳转--------------


"-------------------------start bufexplorer"历史文件列表-------------------
""""""""""""""""""""""""""""""
" BufExplorer
"\be打开历史文件列表，\bv水平新建历史文件列表窗口，\bs垂直新建历史文件列表；
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=1        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
"-------------------------end bufexplorer"历史文件列表-------------------


"-----------------------start ctrlsf----------------------------
let g:ctrlsf_open_left=0
let g:ctrlsf_position='bottom'
"-----------------------end ctrlsf----------------------------


"-----------------------start mark.vim----------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. 用于搜索.
" \n clear this mark (i.e. the mark under the cursor),
" or clear all highlighted marks .
" \* 当前MarkWord的下一个 \# 当前MarkWord的上一个
" \/ 所有MarkWords的下一个 \? 所有MarkWords的上一个
"-----------------------end mark.vim----------------------------


"--------------------start 在浏览器预览 for Mac-----------------------------
"function! ViewInBrowser(name)
"let file = expand("%:p")
"let l:browsers = {
"            \"cr":"open -a \"Google Chrome\"",
"            \"ff":"open -a Firefox",
"            \}
"let htdocs = '/Users/leon1/'
"let strpos = stridx(file,  substitute(htdocs,  '\\\\',  '\',  "g"))
"let file   =  '"'. file . '"'
"exec ":update " .file
""echo file .' ## '. htdocs
"if strpos == -1
"    exec ":silent ! ". l:browsers[a:name] ." file://". file
"else
"    let file = substitute(file, htdocs, "http://127.0.0.1:8090/",  "g")
"    let file = substitute(file,  '\\', '/',  "g"')
"    exec ":silent !  ". l:browsers[a:name] file
"endif
"endfunction
"
"nmap <Leader>cr :call ViewInBroser("cr")<cr>
"nmap <Leader>ff :call ViewInBrowser("ff")<cr>
"--------------------start 在浏览器预览 for Mac-----------------------------


"---------------start ListToggle----------------------
"Toggle Menu and Toolbar
"set guioptions-=m
"set guioptions-=T
"map <silent> <F2> :if &guioptions =~# 'T' <Bar>
    "\set guioptions-=T <Bar>
    "\set guioptions-=m <bar>
"\else <Bar>
    "\set guioptions+=T <Bar>
    "\set guioptions+=m <Bar>
"\endif<CR>
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10
"---------------end Toggle----------------------


"---------------------start a.vim 允许在源文件之间快速轻松地切换 ----------------
let g:alternateExtensions_CPP = "inc,h,H,HPP,hpp"
"---------------------end a.vim 允许在源文件之间快速轻松地切换 ----------------


"------- start  airline Themes --------"
let g:airline_theme='onedark'
"------- end  Airline Themes --------"


"----------------------------------start tern_for_vim-----------------------------------------
" tern_for_vim
"----------------------------------------------------------------------------
let tern_show_signature_in_pum=1
let tern_show_argument_hints='on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete
"----------------------------------end tern_for_vim-----------------------------------------
"
"-------------------------start vim-markdown----------------------
"设置不折叠
"let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_toc_autofit = 1
"set conceallevel=2
"let g:vim_markdown_conceal  =  0
"
" gx: open the link under the cursor 
autocmd BufNewFile,BufRead *.md set filetype=markdown
"这里设置不折叠
let g:vim_markdown_folding_disabled=1       "折叠
let g:vim_markdown_frontmatter=1
"隐藏功能，隐藏了一些符号，比如加粗*, 代码``, 提高显示效果
let g:vim_markdown_conceal = 2
set concealcursor=""
"如果安装了vim-markdow的同时又安装了indentLine的话就需要设置这个，否则隐藏功能不好用
"当光标在此行的时候也不显示隐藏的符号，只有选中才显示。
let g:indentLine_concealcursor = ''
" 打开文本目录
nnoremap <Leader>to :Toc <CR>
nnoremap <Leader>tp :MarkdownPreview <CR>
nnoremap <Leader>tc :MarkdownPreviewClose <CR>
" 格式化表格
nnoremap <Leader>tf :TableFormat <CR>

"-------------------------end vim-markdown----------------------
"
"------------------start-imapFunc()-----------
"设置映射函数，实现在写c/c++代码是能自动填充空格
func SetimapFunc()
    ino , ,<SPACE>
    ino ; ;<SPACE>
    ino <= <SPACE><=<SPACE>
    ino => <SPACE>=><SPACE>
    ino *= <SPACE>*=<SPACE>
    ino /= <SPACE>/=<SPACE>
    ino >> <SPACE>>><SPACE>
    ino << <SPACE><<<SPACE>
    ino >= <SPACE>>=<SPACE>
    ino == <SPACE>==<SPACE>
    ino += <SPACE>+=<SPACE>
    ino && <SPACE>&&<SPACE>
    ino != <SPACE>!=<SPACE>
    inoremap = <c-r>=EqualSign('=')<CR>
    inoremap + <c-r>=EqualSign('+')<CR>

endfunc
    
"实现按F9控制imap的映射的开与关    
"nnoremap <F9> :call SetimapFuncCtl()<CR>
imap <F9> :call SetimapFuncCtl()<CR>
nmap <F9> :call SetimapFuncCtl()<CR>
func SetimapFuncCtl()
    if g:equ == 1
        imapclear
        let g:equ = 0
    else
        exec "call SetimapFunc()"
        let g:equ = 1
    endif
endfunc
"------------------end-imapFunc()-----------

""-------------------start Goyo-----------------------"
nnoremap <Leader>gy :Goyo <CR>
":Goyo
"Toggle Goyo
":Goyo [dimension]
"Turn on or resize Goyo
":Goyo!
"Turn Goyo off
""-------------------end Goyo-----------------------"
