if [ -t 0 ]; then
  # Set GPG_TTY so gpg-agent knows where to prompt.  See gpg-agent(1)
  export GPG_TTY="$(tty)"
  # Set PINENTRY_USER_DATA so pinentry-auto knows to present a text UI.
  export PINENTRY_USER_DATA=USE_TTY=1
fi
