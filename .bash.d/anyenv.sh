#!/bin/sh

# Initial setup
# $ git clone https://github.com/riywo/anyenv ~/.anyenv
# $ exec $SHELL -l
# $ anyenv install rbenv    # ruby
# $ anyenv install plenv    # perl
# $ anyenv install pyenv    # python
# $ anyenv install ndenv    # nodejs
# $ exec $SHELL -l
# $ anyenv versions

if [ -d "$HOME/.anyenv" ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi
