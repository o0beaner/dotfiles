#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
<<<<<<< HEAD
<<<<<<< HEAD
    git clone --depth=1 https://github.com/o0beaner/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install --trace
=======
=======
>>>>>>> upstream/master
    git clone --depth=1 https://github.com/skwp/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
<<<<<<< HEAD
>>>>>>> upstream/master
=======
>>>>>>> upstream/master
else
    echo "YADR is already installed"
fi
