#!/bin/bash


###

echo "Creating 'haxeinstall' directory..."
mkdir haxeinstall
cd haxeinstall

###

echo "Installing dependencies for Haxe and Neko with apt-get. "
echo "We will need your [sudo] password..."
read -p "Press Enter to continue"
sudo apt-get install libzip-dev ocaml subversion libgc-dev libpcre3-dev

###

echo "About to checkout, compile and install Haxe SVN"
read -p "Press Enter to continue"

echo "Checkout latest Haxe SVN code"
svn co http://haxe.googlecode.com/svn/trunk haxe

echo "Compile Haxe"
cd haxe
make clean all
echo "Install Haxe"
sudo make install
cd ..

haxe 

echo ""
echo "Haxe Installed"

###

echo ""
echo "About to checkout, compile and install Neko SVN"
echo "You may have to press 's' a few times to skip optional extra things."
read -p "Press Enter to continue"

echo "Checkout latest Neko SVN code"

svn co http://nekovm.googlecode.com/svn/trunk neko

echo "Compile Neko"
cd neko
make clean all
echo "Install Neko"
sudo make install
cd ..

neko

echo ""
echo "Neko Installed..."

###

echo ""
echo "Haxelib setup"

haxelib setup

###

cd ..
echo "Done"
echo "Type [haxe], [neko], [haxelib] and [haxedoc] at a command line to check they're good to go"

