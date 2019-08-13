#!/bin/bash
#tmux安装包地址:https://github.com/tmux/tmux.git
#tmux配置地址:https://github.com/gpakosz/.tmux.git
echo "一些依赖包的安装"
echo "------------------------------------------------"
echo ""
echo "-------------start install autoconf-------------"
sudo apt-get install autoconf
echo "-------------start install automake-------------"
sudo apt-get install automake
echo "-------------start install pkg-config-------------"
sudo apt-get install pkg-config
echo "-------------start install libevent-dev-------------"
sudo apt-get install libevent-dev
echo "-------------start install libncurses5-dev-------------"
sudo apt-get install libncurses5-dev
echo "-------------start install byacc-------------"
sudo apt-get install byacc

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

echo "--------------SUCESS-------------"
