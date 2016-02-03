#!/bin/sh

# For more details about the use of this code, go to the following URL:
#
#   https://github.com/augensalat/dotfiles
#
# This is my (augensalat) personal base configuration setup.
# You are not supposed to run this yourself.
# Instead - if you understood and like the concept at all - you might want
# clone this repo, and go from there.
#
# Quickstart: Run the following command to bootstrap your new $HOME.
#
#  $ curl -L http://dotfiles.msg.io/ | sh -s GITHUB_USERNAME EMAIL_ADDRESS
#
# If you don't have curl but wget, replace "curl" with "wget -O -".

program=$(basename $0)

info() {
  echo "$program: Info: $@"
}

warn() {
  echo "$program: Warning: $@" >&2
}

fatal() {
  echo "$program: Fatal error: $@" >&2
  exit 1
}

usage() {
  if [ -n "$1" ] ; then
    warn $@;
    echo "" >&2
  fi
  echo "Usage: $program -s GITHUB_USERNAME EMAIL_ADDRESS" >&2
  echo "" >&2
  echo "  where GITHUB_USERNAME means your username at Github" >&2
  echo "  and EMAIL_ADDRESS means the email address you use in Git commits." >&2
  echo "" >&2
  exit 1
}

cd ~
if [ -e .git ] ; then
  warn "$HOME/.git exists - seems this is already under Git control!"
  git submodule update
else
  if [ $# -ne 2 ] ; then
    usage "Wrong number of arguments";
  fi

  username="$1"
  email="$2"

  git init
  git config -f .gitconfig.local user.email $email
  git remote add origin git://github.com/$username/dotfiles.git
  git fetch
  git checkout -b backup
  git checkout origin/master -- .gitignore
  git add .
  git commit -q -m 'Backup my dotfiles'
  git checkout -f master
  git init
  git submodule update --init
fi

if [ -e ~/.anyenv ] ; then
  warn "$HOME/.anyenv exists already"
  if [ ! -d ~/.anyenv ] ; then
    warn "... but it is not a directory!";
  fi
else
  git clone https://github.com/riywo/anyenv ~/.anyenv
  info 'run "exec $SHELL -l" to load the .anyenv environment'
  info 'check and adjust the plugins in .vimrc, the run "vim +PluginInstall +qa"'
fi
