alias cssh='i2cssh -c'
alias gb='git branch'
alias gs='git status'
alias gpl='git pull'
alias gco='git checkout'
alias gpr='hub pull-request -o'

function migrate(){
  bin/rake db:migrate RAILS_ENV=development
} 

function parse_git_branch(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\h:\W \u\$"
function prompt {
  local   RED="\[\033[0;31m\]"
  local   BLUE="\[\e[0;49;34m\]"
  local   GREEN="\[\e[32m\]"

  export PS1="$GREEN\u@localhost:\W$RED\$(parse_git_branch) $BLUE// \[\e[0m\]"
  export PS2='> '
  export PS4='+ '
}

prompt
