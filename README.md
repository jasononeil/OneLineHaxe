OneLineHaxe
===========

A collection of install scripts that can install Haxe and Neko from source with a single line.

Just copy and paste the command into your command line, press enter and a few minutes later you should have a working Haxe/Neko install for your OS.

Versions
--------

### Linux

#### Ubuntu

**Tested on 10.04, 12.04, 12.10, some 32bit and some 64bit. Should be fairly generic.**

Each of these require `curl` to be installed.  If you don't have it installed, you can run `sudo apt-get install curl`, and then use the commands below.

Latest GIT:

    sudo apt-get install curl; bash <(curl -s https://raw.github.com/jasononeil/OneLineHaxe/master/scripts/linux-ubuntu-1204-haxe-git.sh)

Haxe 3.1.2, Neko 2.0:

    sudo apt-get install curl; bash <(curl -s https://raw.github.com/jasononeil/OneLineHaxe/master/scripts/linux-ubuntu-1204-haxe-3-1-2.sh)

Contributions
-------------

##### New Scripts / Fixes

I'd love to collect different scripts here for different OS's and different Haxe versions.  Feel free to fork the repo, add a new script (or fix one) and update the README to include the code to launch your script.

##### Extra Info

If you have any extra info, eg ("this also works with Ubuntu 13.04") send a pull request with an update to the README.

##### Issues

If you have any issues, requests, or pull requests just aren't your thing, feel free to file a [New Issue](https://github.com/jasononeil/OneLineHaxe/issues/new) and we'll try look at it.
