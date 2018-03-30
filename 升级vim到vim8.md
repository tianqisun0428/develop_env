# 升级vim到vim8的步骤
[TOC]
### vim7爆出严重安全漏洞，升级到vm8，过程如下：

- 首先卸载原有版本的vim

  `yum remove vim -y`

- 下载vim需要的一些安装包`nvurse`,主要作用是提供字符终端处理库


  `yum install ncurses-devel -y`

如果失败，提示unknown host apt.sw.be，手工安装：

```
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/ncurses-devel-5.9-13.20130511.el7.x86_64.rpm

yum install ncurses-devel-5.9-13.20130511.el7.x86_64.rpm
```

- 从github上下载vim8并进行安装

  ```
  git clone https://github.com/vim/vim.git
  cd vim/src
  make
  make install
  ```

- 编辑文件：设定其为默认程序

  ```
  /usr/local/bin/vim /etc/profile.d/path.sh

  ```

- 编辑shell脚本，添加环境变量

  ```
  #!/bin/bash
  export PATH=$PATH:/usr/local/bin/vim
  ```

- 生效

  ```
  source /etc/profile.d/path.sh
  vim -v
  ```

- 添加python支持

  1、查看是否支持python

  ```
  vim --version | grep python
  ```

![image](https://images0.cnblogs.com/blog/593399/201504/191603093395517.png)



说明没有加入Python支持，这个时候如果使用YouCompleteMe这个插件，就会出现这样的警告

![image](https://images0.cnblogs.com/blog/593399/201504/191603106673545.png)

​	2、解决方法:重新编译安装Vim,开启Vim的Python支持,即可。

```
./configure  --enable-pythoninterp=yes --with-python-config-dir=/usr/lib64/python2.6/config
```

提示：可能遇到下面的问题

![image](https://images0.cnblogs.com/blog/593399/201504/191604056988831.png)

解决办法：

```
yum install python-devel
```

​	3、再次查看，Vim已经加入Python支持



### 利用Git安装 最简单也是最有效的方法

1. 获取Vim仓库：   

　　`git clone https://github.com/vim/vim.git `

2. 升级到最新的版本：

   ```
   cd vim
   git pull 
   ```


3. 安装：

   ```
   cd src
   make distclean #如果你以前编译过Vim
   make
   sudo make install
   ```
