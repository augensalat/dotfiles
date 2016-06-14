#!/bin/sh

case "$OSTYPE" in
  darwin*)
    if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
      . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
    elif [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
  *)
esac
