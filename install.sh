#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo 'let g:session_autosave = '"'yes'" >> ~/.vimrc
    echo "Installing YADR for the first time"
    git clone --depth=1 https://github.com/o0beaner/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "YADR is already installed"
fi
