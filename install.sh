#!/bin/sh

if [ ! -d "$HOME/.robbydots" ]; then
    echo "Installing Robby Dots for the first time"
    git clone --depth=1 https://github.com/robbykim/dotfiles.git "$HOME/.robbydots"
    cd "$HOME/.robbydots"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "Robby Dots already installed"
fi
