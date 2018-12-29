

#VIM使用与配置
[TOC]
##使用

###为函数添加注释快捷键
1  熟悉VIM添加注释的快捷键，主要是用了NERDCommenter的快速添加注释

- \cc 为当前行的代码注释
- \ca 切换注释的方式
- \cs 性感的注释
- \cu  撤销注释
- [行数] \cc 为光标后的几行进行注释
- [行数] \cc 为光标后的几行取消注释

2 熟悉为函数添加代码块的注释 运行命令 “:Dox”
### 为文件添加头，作者注释

```
"SET Comment START
autocmd BufNewFile *.php,*.js,*.cc,*.h exec ":call SetComment()" |normal 10Go
func SetComment()
    if expand("%:e") == 'php'
        call setline(1, "<?php")
    elseif expand("%:e") == 'js'
        call setline(1, '//JavaScript file')
    elseif expand("%:e") == 'cc'
        call setline(1, '//C++ file')
    elseif expand("%:e") == 'h'
        call setline(1, '//头文件 file')
    endif
    call append(1, '//***********************************************')
    call append(2, '//      Filename: '.expand("%"))
    call append(3, '//        Author: tianqisun - *****@163.com')
    call append(4, '//   Description: ---')
    call append(5, '//        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(6, '// Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(7, '//***********************************************')
"    call append(10, '')
endfunc
"SET Comment END

```
###查找与替换

- 查找当前单词

  在normal模式下按下*即可查找光标所在单词（word）， 要求每次出现的前后为空白字符或标点符号。例如当前为foo， 可以匹配foo bar中的foo，但不可匹配foobar中的foo。 这在查找函数名、变量名时非常有用。

- 查找与替换

  `:s（substitute）`命令用来查找和替换字符串。语法如下：

  :{作用范围}s/{目标}/{替换}/{替换标志}
  例如`:%s/foo/bar/g`会在全局范围(%)查找foo并替换为bar，所有出现都会被替换（g）

- 作用范围

  作用范围分为当前行、全文、选区等等。

  当前行：`:s/foo/bar/g`
  全文：`:%s/foo/bar/g`
  选区，在Visual模式下选择区域后输入:，Vim即可自动补全为 :'<,'>。 `:'<,'>s/foo/bar/g`
  2-11行：`:5,12s/foo/bar/g`
  当前行.与接下来两行+2：`:.,+2s/foo/bar/g`

- 替换标志

  上文中命令结尾的g即是替换标志之一，表示全局global替换（即替换目标的所有出现）。 还有很多其他有用的替换标志：

  空替换标志表示只替换从光标位置开始，目标的第一次出现：`:%s/foo/bar`
  i表示大小写不敏感查找，I表示大小写敏感：`:%s/foo/bar/i`
   等效于模式中的\c（不敏感）或\C（敏感）`:%s/foo\c/bar`
  c表示需要确认，例如全局查找"foo"替换为"bar"并且需要确认：`:%s/foo/bar/gc`
  回车后Vim会将光标移动到每一次"foo"出现的位置，并提示
  `replace with bar (y/n/a/q/l/^E/^Y)?`
  按下y表示替换，n表示不替换，a表示替换所有，q表示退出查找模式， l表示替换当前位置并退出。^E与^Y是光标移动快捷键，

- 大小写敏感配置

  Vim 默认采用大小写敏感的查找，为了方便我们常常将其配置为大小写不敏感：
  " 设置默认进行大小写不敏感查找
  `set ignorecase`
  " 如果有一个大写字母，则切换到大小写敏感查找
  `set smartcase `


###命令行编辑中使用 vi 模式。
	要启用它，需要执行命令 `set -o vi`

###linux下用ctrl+r快速搜索history命令
ctrl+r (继续反向搜索)

###vim 做标记mark

Vim 允许你在文本中放置自定义的标记。命令 "ma" 用 a 标记当前的光标位置。你可以在文本中使用 26 个标记（a到z）。这些标记是不可见的，只是一个由 Vim 记住的位置。
要跳到一个你定义的标记，可以使用命令 `{mark}，这里 {mark} 是指定义标记的那个字母。所以，移到标记a的命令是：
        `a

命令 'mark（单引号加上一个标记）会移到标记所在行的行首。这与 `mark 命令是不同的， 
后者是移到标记所在行上被标记的列。

标记在需要处理一个文件的两个相关地方的时候非常有用。假设你在处理文末的时候需要 
查看文首的一些内容，先移动到行首，设置一个标记 s (start)：

        ms

然后移动到你需要处理的地方，再设置一个标记 e (end)：

        me

现在你可以随意移动，当你需要看开头的地方，可以使用这个命令移到那里：

        's

然后使用 '' 跳回来。或者用 'e 跳到你正在处理的文尾的地方。 
    这里使用 s 和 e 作标记名没有特别的含义，只是为了好记而已。

你可以用如下命令取得所有的标记的列表：

        :marks

你会注意到有一些特殊的标记，包括：

        '       跳转前的位置 
        "       最后编辑的位置 
        [       最后修改的位置的开头 
        ]       最后修改的位置的结尾 

补充：如果想要删除marks，可用命令delmarks + markname 。

### Vim配色方案和字体设置
有时用gvim打开文件时，发现字体特别难看，就说明字体库没有安装，或者字体没有设置。 目前发现适合编程的配色方案是molokai，字体是
 `Droid Sans Mono for Powerline Nerd Font Complete.otf`
另外如果还需要额外字体，就将看中的字体，下载到 `~/.fonts` 目录( 没有就新建 `mkdir .fonts` )
    可以从windows系统中，抓字体，放到 `~/.fonts` 目录下
    之后，执行 `fc-cache -vf ~/.fonts`，以便系统更新字体缓存
    最后，在gvim中，使用 `:set guifont=*` 就可以用gui的方式选择字体了
    ps: 以下针对我自己
    - 我的vim字体是用的 `set guifont=Fira\ Mono\ 14`
    - 新建文件夹`~/.fonts`，然后将字体的字库`\Fira-master\Fira-master\ttf`所有ttf格式字体放到`~/.fonts` 目录下，
    - 执行命令`fc-cache -vf ~/.fonts` 更新字体完成，这样在gvim中，使用`:set guifont=*` 就可以看到自己安装的字体了

### SSH putty字体设置
此类字体设置比较舒服的还是字体：`fira mono` 字号`14`，`常规`
​	    

