# Description

This dotfiles setup puts your home directory under Git control.
The local git directory ".git" is the one that is called "dotfiles" on
the remote host.

Carefully follow the instructions below in order to install this setup
as your own dotfiles.

# Installation

Start by clicking the "fork" button to get your Github copy of this
repo.

Usually you get your local instance of a (remote) Git repository with
`git clone`, but hold on - apart from the fact that a few difference
must remain between mine and your dotfiles, `git clone` would require
an empty destination directory. Therefore don't clone, fetch instead
(and make sure to replace `YOUR_USER_NAME`, `YOU@EXAMPLE.COM` and
`YOUR_GITHUB_TOKEN`):

```sh
cd
git init
git remote add origin git@github.com:YOUR_USER_NAME/dotfiles.git
git fetch
git checkout -b backup
git checkout origin/master -- .gitignore
git add .
git commit -m 'Backup my dotfiles'
git checkout -f master
git config -f .gitconfig.local user.email YOU@EXAMPLE.COM
git config -f .gitconfig.local github.token YOUR_GITHUB_TOKEN
git submodule update --init
vim +PluginInstall +qall
```

# Adding your own (configuration) files to the repository

The contained `.gitignore` disables all files in the home directory by
default and then explicitely excludes specific files from this rule.

There are two options to add additional files to the repository:

1. Update .gitignore - i.e. add a line like
   ```
   !/.myconf
   ```
2. Use the force...
   ```sh
   git add -f .myconf
   ```

# Restore / Undo

Restore a certain file from the backup:

```sh
git checkout backup -- .bashrc
git commit -m 'Restore original .bashrc'
```

If you came to the conclusion everything was a big mistake and you want
your old files back - don't worry - you made a backup, n'est ce pas?

```sh
cd
git checkout backup
rm -rf .git .gitignore
```
