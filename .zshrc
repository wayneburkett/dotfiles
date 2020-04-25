# global .zshrc
#
# only put stuff here that should be committed and that would apply on any 
# laptop (i.e. don't put work stuff (see the bottom of this file for where 
# to put work stuff) or anything private in this file) 

eval "$(hub alias -s)"

# default ruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.7.0

# command prompt
precmd () { PS1="[%~] %F{magenta}$(parse_git_branch)%f $ " }

export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;

set -o vi

# laptop
alias laptop='bash <(curl -s https://raw.githubusercontent.com/monfresh/laptop/master/laptop)'

# more aliases
alias ll='ls -lah'
alias master='gitswitch master'
alias develop='gitswitch develop'
alias core='gitswitch core'
alias react-pack='npm install && cd ios && pod install && cd .. && npm pack'
alias pod-refresh='rm -rf "${HOME}/Library/Caches/CocoaPods" && rm -rf "`pwd`/Pods/" && pod update --verbose'

gitswitch ()
{
    git fetch;
    git checkout $1;
    git reset --hard
    git pull origin $1;
}

function branch
{
    git rev-parse --abbrev-ref HEAD
}

function tbranch
{
    # get the branch name and strip out trailing characters (e.g. CAB-1234a => CAB-1234, QQ-1232-a1 => QQ-1232)
    echo $(branch) | tr '[:lower:]' '[:upper:]' | grep -o '[A-Z]\{2,\}\-[0-9]\{1,\}'
}

function parse_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# a place to keep stuff that should be kept only to this laptop
FILE=~/.zshrc_local  && test -f $FILE && source $FILE
