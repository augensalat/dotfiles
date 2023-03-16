# Description

This dotfiles setup puts your home directory under Git control.
The local git directory ".git" is the one that is called "dotfiles" on
the remote host.

Carefully follow the instructions below in order to install this setup
as your own dotfiles.

# Installation

Start by clicking the <kbd>Fork</kbd> button to get your own copy of
this repo on Github.

Usually you create a local instance of a (remote) Git repository with
`git clone`, but hold on - apart from the fact that a few differences
must remain between mine and your dotfiles, `git clone` would require
an empty destination directory. Therefore don't clone, fetch instead
(and make sure to replace `YOUR_USER_NAME` and `YOU@EXAMPLE.COM`):

```sh
cd
git init
git config -f .gitconfig.local user.email YOU@EXAMPLE.COM
git remote add origin git@github.com:YOUR_USER_NAME/dotfiles.git
git fetch
git switch -f master
git submodule update --init
vim +PluginInstall +qall
```

Optionally:

```sh
git clone https://github.com/riywo/anyenv ~/.anyenv
exec $SHELL -l
```

# Adding your own (configuration) files to the repository

The `.gitignore` ignores all files. You must force Git to track new files:

```sh
git add -f NEW_FILE
```

