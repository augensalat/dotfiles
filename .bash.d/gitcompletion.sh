#!/bin/sh

case "$OSTYPE" in
  darwin*)
    if [ -f $HOME/bin/git-completion.bash ]; then
      . $HOME/bin/git-completion.bash
    elif [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
      . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
    elif [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
  *)
esac
