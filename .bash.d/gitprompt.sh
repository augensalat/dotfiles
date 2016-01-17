#!/bin/sh

# show branch if cwd is in a git repo
if [ "\$(type -t __git_ps1)" ]; then
  PS1="\$(__git_ps1 '(%s) ')$PS1"
fi
