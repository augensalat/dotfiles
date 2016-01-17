#!/bin/sh

SSH_AUTH_SOCK=$(ls -1t /tmp/ssh-*/agent.* | head -n1)
echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
