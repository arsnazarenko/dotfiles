if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec /home/arsnaz/startw
fi

. /usr/share/git-core/contrib/completion/git-prompt.sh
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\]:\W\[\033[00m\]\$\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]:\w\[\033[00m\]\$\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\] '
fi

