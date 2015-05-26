#!/bin/bash

# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles 
# in ~/dotfiles
# Based on https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
# by Mike Smalley

# TODO: problem with oh-my-zsh folder during setup

########## Variables

# dotfiles dir
dir=~/dev/dotfiles

olddir=~/dotfiles_old

# list of files / folders to symlink
files="aliases vimrc zshrc oh-my-zsh"

##########

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub
    if [[ ! -d ./oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
