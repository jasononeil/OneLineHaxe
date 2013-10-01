#!/bin/bash

# Die function, Taken from http://stackoverflow.com/questions/64786/error-handling-in-bash
function error_exit
{
	PROGNAME=$(basename $0)
    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

###

echo ""
echo "Creating 'haxeinstall' directory..."
mkdir -p haxeinstall || error_exit "Failed to create 'haxeinstall' directory."
cd haxeinstall

###

echo ""
echo "Installing dependencies for Haxe and Neko with apt-get. "
echo "We will need your password..."

sudo apt-get update
sudo apt-get install libzip-dev ocaml subversion libgc-dev libpcre3-dev || error_exit "ERROR: Failed to install dependencies with apt-get"

###

echo ""
echo "About to checkout, compile and install Haxe SVN"
read -p "Press Enter to continue"

echo "Checkout latest Haxe SVN code"
rm -Rf haxe
svn co http://haxe.googlecode.com/svn/trunk haxe || error_exit "Failed to checkout haxe source"

echo "Compile Haxe"
cd haxe
make clean all || error_exit "Failed to run 'make clean all' on haxe codebase"
echo "Install Haxe"
sudo make install || error_exit "Failed to run 'sudo make install' on haxe codebase"
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
rm -Rf neko
svn co http://nekovm.googlecode.com/svn/trunk neko || error_exit "Failed to checkout neko source"

echo "Compile Neko"
cd neko
make clean all || error_exit "Failed to run 'make clean all' on neko codebase"
echo "Install Neko"
sudo make install || error_exit "Failed to run 'sudo make install' on neko codebase"
cd ..

neko

echo ""
echo "Neko Installed..."

###

echo ""
echo "Haxelib setup" || error_exit "Failed to setup haxelib"

haxelib setup

###

cd ..
echo "Done"
echo "Type [haxe], [neko], [haxelib] and [haxedoc] at a command line to check they're good to go"

