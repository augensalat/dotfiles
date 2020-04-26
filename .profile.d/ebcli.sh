#!/bin/sh

if [ -d "$HOME/.ebcli-virtual-env" ] ; then
 export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"
fi
