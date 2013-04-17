#!/bin/sh


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

echo ""
echo "Haxe Installed"

###

echo "About to checkout, compile and install Neko SVN"
read -p "Press Enter to continue"

echo "Checkout latest Neko SVN code"

svn co http://nekovm.googlecode.com/svn/trunk neko

echo "Compile Neko"
cd neko
make clean all
echo "Install Neko"
sudo make install
cd ..

echo ""
echo "Neko Installed..."

###

echo "You need to setup your haxelib path.  The default is /usr/lib/haxe/lib/"
read -p "Press Enter to continue"

haxelib setup

###

cd ..
echo "Done"
echo "Type [haxe], [neko], [haxelib] and [haxedoc] at a command line to check they're good to go"

