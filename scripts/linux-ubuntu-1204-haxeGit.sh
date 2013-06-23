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
sudo apt-get install libzip-dev ocaml git-core libgc-dev libpcre3-dev || error_exit "ERROR: Failed to install dependencies with apt-get"

###

echo ""
echo "About to checkout, compile and install Haxe Git/Development"
read -p "Press Enter to continue"

echo "Checkout latest Haxe development branch from Github"

if [ -d "haxe" ]; then
  # It exists, so checkout and update
  cd haxe 
  git reset --hard || error_exit "Failed to run 'git reset --hard' in haxe directory"
  git checkout development || error_exit "Failed to run 'git checkout development' in haxe directory"
  git pull || error_exit "Failed to run 'git pull' in haxe directory"
  git submodule update || error_exit "Failed to run 'git submodule update' in haxe directory"
else
  # It does not exist, so clone 
  git clone git://github.com/HaxeFoundation/haxe.git || error_exit "Failed to clone haxe source from Github"
  cd haxe
  git checkout development || error_exit "Failed to run 'git checkout development' in haxe directory"
  git submodule init || error_exit "Failed to run 'git submodule init' in haxe directory"
  git submodule update || error_exit "Failed to run 'git submodule update' in haxe directory"
fi

echo "Compile Haxe"
make clean all || error_exit "Failed to run 'make clean all' on haxe codebase"
echo "Install Haxe"
sudo make install || error_exit "Failed to run 'sudo make install' on haxe codebase"
cd ..

haxe 

echo ""
echo "Haxe Installed"

###

echo ""
echo "About to checkout, compile and install Neko Git/Master"
echo "You may have to press 's' a few times to skip optional extra things."
read -p "Press Enter to continue"

echo "Checkout latest Neko Git code"

if [ -d "neko" ]; then
  # It exists, so checkout and update
  cd neko 
  git reset --hard || error_exit "Failed to run 'git reset --hard' in neko directory"
  git pull || error_exit "Failed to run 'git pull' in neko directory"
else
  # It does not exist, so clone 
  git clone git://github.com/HaxeFoundation/neko.git || error_exit "Failed to checkout neko source from Github"
  cd neko
fi


echo "Compile Neko"
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

