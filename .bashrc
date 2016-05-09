#!/bin/sh

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

case "$OSTYPE" in
  linux*)
    distrib_id=$(lsb_release -si 2>/dev/null)

    if [ -n "$distrib_id" ] ; then
      DIST=$(echo "$distrib_id" | tr '[:upper:]' '[:lower:]')
    elif [ -f /etc/debian_version ]; then
      DIST=debian
    elif [ -f /etc/redhat-release ]; then
      DIST=redhat
    elif [ -f /etc/SuSE-release ]; then
      DIST=opensuse
    else
      DIST=unknown
    fi

    case "$DIST" in
      redhat*)
        if [ -f /etc/bashrc ]; then
          . /etc/bashrc
        fi
        ;;
    esac
    ;;
  darwin*)
    ;;
  freebsd)
    ;;
  solaris)
    ;;
  *)
esac

#
# Source all executable files in ~/.bash.d
#
# Note: environment variables from this script are visible in sourced scripts.
if test -d $HOME/.bash.d ; then
  for s in $HOME/.bash.d/* ; do
    test -r $s -a -f $s -a -x $s && . $s
  done
  unset s
fi

