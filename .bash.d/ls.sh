case "$-" in
    *i*)
        if test -z "$LS_OPTIONS" ; then
            if ls --color -d . >/dev/null 2>&1; then
                LS_OPTIONS=--color=tty
            elif ls -G -d . >/dev/null 2>&1; then
                LS_OPTIONS=-G
            else
                LS_OPTIONS=
            fi

            #
            # useful ls aliases
            #
            _ls ()
                {
                local IFS=' '
                command ls $LS_OPTIONS ${1+"$@"}
            }
            alias ls=_ls
            alias dir='ls -l'
            alias ll='ls -l'
            alias la='ls -la'
            alias l='ls -alF'
            alias ls-l='ls -l'
        fi
    ;;
esac
