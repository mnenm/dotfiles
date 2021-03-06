LANG=ja_JP.utf8
export LANG=ja_JP.UTF-8

autoload -U compinit
compinit

setopt COMPLETE_IN_WORD

autoload -U predict-on

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt append_history
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt nolistbeep

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESSCHARSET=utf-8

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export PYENV_PATH=$HOME/.pyenv
export PATH=/usr/local/bin:$PYENV_PATH/bin:$PATH

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

[ -f $HOME/.zplugrc ] && source $HOME/.zplugrc
[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases
[ -f $HOME/.zsh_functions ] && source $HOME/.zsh_functions
# [[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
