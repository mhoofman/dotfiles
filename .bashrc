#-------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin"
PATH="/usr/local/bin:/usr/local/share/npm/bin:/usr/local/mysql/bin:$PATH"

# node.js
NODE_PATH="/usr/local/lib/node"

# ------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------

GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;0m\]"
PS_CLEAR="\[\033[0m\]"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\u:\w\$(parse_git_branch)$ "

# ------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------

alias du1='du -h --max-depth=1'
alias vi='vim'

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

