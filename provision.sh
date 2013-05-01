#!/bin/sh
if [ $1 = "core" -o $1 = "all" ]
then
# Core Repo Packages needed
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential libxml2-dev cmake vim curl python-software-properties software-properties-common byobu zip
fi

if [ $1 = "gitnode" -o $1 = "all" ]
then
# Installing Development tools
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install git nodejs
fi

if [ $1 = "spf13" -o $1 = "all" ]
then
# Downloading and installing git repos
curl http://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
fi

if [ $1 = "rr" -o $1 = "all" ]
then
# RoadRunner
mkdir -p ~/rr/build/all
mkdir -p ~/rr/build/ThirdParty
mkdir -p ~/rr/install
cd ~/rr; git clone git://github.com/stanley-gu/roadrunner.git roadrunnerlib
cd ~/rr; git checkout -f v1.0
fi

if [ $1 = "rr-install" -o $1 = "all" ]
then
cd ~/rr/build/ThirdParty; cmake ../../roadrunnerlib/ThirdParty/ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../install -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_C_FLAGS="-fPIC" -DBUILD_SHARED_LIBS=ON
cd ~/rr/build/ThirdParty; cmake ../../roadrunnerlib/ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../install -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_C_FLAGS="-fPIC" -DBUILD_SHARED_LIBS=ON -DTHIRD_PARTY_INSTALL_FOLDER=../../install
cd ~/rr/build/ThirdParty; make -j4; make install
cd ~/rr/build/all; make -j4; make install
fi

if [ $1 = "rr-config" -o $1 = "all" ]
then
sudo echo "export PATH=~/rr/install/bin:\$PATH" >> ~/.bashrc
cd ~; echo "/home/vagrant/rr/install/lib" > rr.conf
sudo mv rr.conf /etc/ld.so.conf.d/
sudo ldconfig
fi

if [ $1 = "pandoc" -o $1 = "all" ]
then
# Writing tools
sudo apt-get -y install haskell-platform
cabal update
cabal install pandoc
sudo echo "export PATH=~/.cabal/bin:\$PATH" >> ~/.bashrc
fi

if [ $1 = "texlive" -o $1 = "all" ]
then
sudo add-apt-repository -y ppa:texlive-backports/ppa
sudo apt-get -y update
sudo apt-get -y install texlive texlive-latex-extra
fi

if [ $1 = "webdev" -o $1 = "all" ]
then
sudo npm install -g bower
sudo npm install -g nodemon
sudo npm install -g express
fi

if [ $1 = "java" -o $1 = "all" ]
then
sudo apt-get install -y openjdk-6-jdk
echo "export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-i386/" >> ~/.bashrc
fi



