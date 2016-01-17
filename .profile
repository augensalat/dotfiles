# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings.

test -z "$PROFILEREAD" && . /etc/profile || true

#
# Source all executable (ba)sh scripts at ~/.profile.d/*.sh
#
if test -d $HOME/.profile.d ; then
  for s in $HOME/.profile.d/*.sh ; do
    test -r $s -a -f $s -a -x $s && . $s
  done
  unset s
fi
