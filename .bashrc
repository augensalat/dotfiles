#!/bin/sh

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

#
# Source all executable files in ~/.bash.d
#
if test -d $HOME/.bash.d ; then
  for s in $HOME/.bash.d/* ; do
    test -r $s -a -f $s -a -x $s && . $s
  done
  unset s
fi

