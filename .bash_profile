alias v='vim .'
alias cssh='i2cssh -c'
alias pg='pg_ctl -D /usr/local/var/postgres'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gpl='git pull'
alias gco='git checkout'
alias gpr='hub pull-request -o'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$PATH:/usr/local/sbin/

function migrate(){
  bin/rake db:migrate RAILS_ENV=development
} 

function parse_git_branch(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function workers(){
  foreman start
}

function prompt {
  local   RED="\[\033[0;31m\]"
  local   BLUE="\[\e[0;49;34m\]"
  local   GREEN="\[\e[32m\]"

  export PS1="$GREEN\u@localhost:\W$RED\$(parse_git_branch) $BLUE// \[\e[0m\]"
  export PS2='> '
  export PS4='+ '
}

prompt
