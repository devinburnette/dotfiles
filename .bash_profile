eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init - bash)"

source "$HOME/.bootstrap/env.sh"

export BASH_SILENCE_DEPRECATION_WARNING=1

alias ag='ag --hidden'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias flushdns='sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache'
alias ssm='aoe -- aws ssm start-session --target'
alias aou-legacy='aws_okta_up "legacy-betterment-human_sre_admin"'
alias aou-sensitive='aws_okta_up "live-sensitive-sre-admin"'
alias aou-nonsensitive='aws_okta_up "live-nonsensitive-sre-admin"'
alias prod-encrypt="pbpaste | ansible-vault encrypt_string --vault-password-file=~/ansible-vault/production.key"
alias prod-decrypt="ansible-vault decrypt --vault-password-file=~/ansible-vault/production.key --output=- <(pbpaste | sed 's/^[[:space:]]*//g')"
alias dev-encrypt="pbpaste | ansible-vault encrypt_string --vault-password-file=~/ansible-vault/development.key"
alias prod-decrypt="ansible-vault decrypt --vault-password-file=~/ansible-vault/development.key --output=- <(pbpaste | sed 's/^[[:space:]]*//g')"
alias mycoach="RBENV_VERSION=2.7.5 BUNDLE_GEMFILE=$HOME/src/coach/coach_cli/Gemfile bundle exec $HOME/src/coach/coach_cli/exe/coach"
alias sdm_login="sdm login < ~/.ssh/.sdm_email"
alias k9sn="k9s --context live_nonsensitive_sre_admin --namespace stage"
alias k9ss="k9s --context live_sensitive_sre_admin --namespace production"

# function aws-okta() {
#   case $1 in
#     exec)
#       /opt/homebrew/bin/aws-okta --mfa-duo-device u2f "$@"
#       ;;
#     *)
#       /opt/homebrew/bin/aws-okta "$@"
#       ;;
#   esac
# }

function gpu() {
  git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`
}

function gpf() {
  git push --force-with-lease
}

function gpl() {
  git pull origin `git rev-parse --abbrev-ref HEAD`
}

function gpr {
  gh pr create --fill
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt() {
  local RED="\[\033[0;31m\]"
  local BLUE="\[\e[0;49;34m\]"
  local GREEN="\[\e[32m\]"

  export PS1="$GREEN\u@localhost:\W$RED\$(parse_git_branch) $BLUE\# \[\e[0m\]"
  export PS2='> '
  export PS4='+ '
}

prompt

[ -f ~/.bashrc ] && source ~/.bashrc
