# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

#
# Source all executable (ba)sh scripts at ~/.profile.d/*.sh
#
if test -d $HOME/.profile.d ; then
  for s in $HOME/.profile.d/*.sh ; do
    test -r $s -a -f $s -a -x $s && . $s
  done
  unset s
fi
