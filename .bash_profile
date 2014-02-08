export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
stty -ixon
defaults write NSGlobalDomain KeyRepeat -int 0

##################### ALIASES ############################
#########################################################
#alias be="bundle exec"
#alias c="bundle exec rails c"
#alias s="bundle exec rails s"
#alias cdpr="cd /Users/neil/Projects"
#alias cdweb="cd /Users/neil/Work/soundtracking-web"
#########################################################


################ bash completion? #######################
#########################################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
fi
#########################################################


##################### PROMPT ############################
#########################################################
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) / '
}

export -f parse_git_branch

function parse_host_name {
  #echo sr`echo $HOSTNAME 2> /dev/null | sed -e s/[^0-9]//g`
  echo $HOSTNAME
}

function format_time {
  echo '[$(date +%H:%M:%S)]'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local  LIGHT_BLUE="\[\033[1;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local        GRAY="\[\033[0;37m\]"
  local  LIGHT_GRAY="\[\033[1;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

#Old main line:
#$BLUE$(format_time) $LIGHT_RED$(parse_host_name):\W$GREEN \$(parse_git_branch)\

PS1="${TITLEBAR}\
$LIGHT_RED$(parse_host_name)$GRAY:$LIGHT_BLUE\W$GREEN \$(parse_git_branch)\
$GRAY\$ $WHITE"
PS2='> '
PS4='+ '
}
proml
###########################################################

###################### Colored Less ######################
##########################################################
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
##########################################################
