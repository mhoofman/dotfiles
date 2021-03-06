#!/bin/bash
#-------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin"
PATH="/usr/local/bin:/usr/local/share/npm/bin:$PATH"
PATH="/usr/local/mysql/bin:$PATH"

# node.js require path
export NODE_PATH="/usr/local/lib/node"

# ------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\u@\h:\w\$(parse_git_branch)$ "

# ------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------

alias dir_size='du -h | tail -n 1'
alias vi='vim'

# Mac
alias m='mate'

# FreeBSD
alias listen='sockstat -4 -l'

# ------------------------------------------------------------------------
# LS AND DIRCOLORS
# ------------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON="-hBG"

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
alias ls="command ls $LS_COMMON"

# these use the ls aliases above
alias ll="ls -l"

