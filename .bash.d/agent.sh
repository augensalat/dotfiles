#!/bin/sh

# Start ssh-agent unless it is running.
# Set the SSH_AUTH_SOCK environment variable if ssh-agent is already
# running in another terminal session for the same user.

function start_agent {
  eval $(/usr/bin/ssh-agent | sed 's/^echo/#echo/')
  # /usr/bin/ssh-add;
}

if [ -z "$SSH_AUTH_SOCK" ] ; then
  SSH_AUTH_SOCK=$(ls -1t /tmp/ssh-*/agent.* 2>/dev/null | head -n1)
  if [ -z "$SSH_AUTH_SOCK" ] ; then
    start_agent
  else
    export SSH_AUTH_SOCK
  fi
else
  if [ ! -S "$SSH_AUTH_SOCK" ] ; then
    start_agent
  fi
fi
