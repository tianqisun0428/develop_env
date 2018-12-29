#!/bin/bash
#tmux安装包地址:https://github.com/tmux/tmux.git
#tmux配置地址:https://github.com/gpakosz/.tmux.git
echo "一些依赖包的安装"
echo "------------------------------------------------"
echo ""
echo "-------------start install autoconf-------------"
sudo yum install autoconf.noarch
echo "-------------start install automake-------------"
sudo yum install automake.noarch
echo "-------------start install pkg-config-------------"
sudo yum install pkg-config
echo "-------------start install libevent-dev-------------"
sudo yum install libevent-devel.x86_64
echo "-------------start install libncurses5-dev-------------"
sudo yum install ncurses-devel.x86_64

echo "--------------------下载源码 tmux---------------------"
git clone https://github.com/tmux/tmux.git
sleep 5
echo "-------------开始编译源码安装 tmux-------------"
cd tmux
sh autogen.sh
./configure && make
sudo make install

echo "-------------开始加载配置文件 tmux-------------"

cd
#删除之前残留文件
rm -rf .tmux*
git clone https://github.com/gpakosz/.tmux.git
sleep 5
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "--------------设定环境变量为xterm-256色-------------"

echo "if [ \"\$TERM\"  ==  \"xterm\"  ];  then"  >> ~/.bashrc
echo " export TERM=xterm-256color"  >> ~/.bashrc
echo "fi"  >> ~/.bashrc
source ~/.bashrc

echo "--------------SUCCESS-------------"

