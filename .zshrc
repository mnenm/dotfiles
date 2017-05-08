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

export COMPOSER_PATH=$HOME/.composer/vendor
export PATH=/usr/local/bin:$COMPOSER_PATH/bin:$PATH

[ -f $HOME/.zplugrc ] && source $HOME/.zplugrc
[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases
[ -f $HOME/.zsh_functions ] && source $HOME/.zsh_functions
# [[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
