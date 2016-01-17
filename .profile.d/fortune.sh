#!/bin/sh

# Some people don't like fortune. If you make this script executable, and if
# you have fortune installed, you will have a fortune each time you log in ;-)

if [ -x /usr/bin/fortune ] ; then
    echo
    /usr/bin/fortune
    echo
fi

