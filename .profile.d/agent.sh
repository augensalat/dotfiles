#!/bin/sh

# This script helps finding the SSL auth socket in screen sessions that
# outlived a login session.
# http://www.bootc.net/archives/2013/06/09/my-perfect-gnupg-ssh-agent-setup/#SSH_Agent_within_screen_sessions

# set up SSH agent socket symlink
export SSH_AUTH_SOCK_LINK="/tmp/ssh-$USER/agent"

if ! [ -r $(readlink $SSH_AUTH_SOCK_LINK) ] && [ -r $SSH_AUTH_SOCK ]; then
  mkdir -p "$(dirname $SSH_AUTH_SOCK_LINK)" &&
  chmod go= "$(dirname $SSH_AUTH_SOCK_LINK)" &&
  ln -sfn $SSH_AUTH_SOCK $SSH_AUTH_SOCK_LINK
fi
