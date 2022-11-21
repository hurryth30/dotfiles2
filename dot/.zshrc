#!/bin/sh

# ---------------------------
# plugin
# ---------------------------
# appay pure
fpath+=($HOME/.zsh/pure)

# prompt
autoload -Uz promptinit
promptinit
prompt pure

# syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------------------------
# general
# ---------------------------
# vim keybindings
bindkey -e
# ESCキーのタイムラグ対策
KEYTIMEOUT=1
# プロンプトスタイル
# export PROMPT=''
# Ctrl+Dでログアウトしないようにする
IGNOREEOF=100
# zsh no matchs foundを回避
setopt +o nomatch
# Ctrl+Dでログアウトしないようにする
setopt IGNOREEOF

# --------------------------------
# histrory
# --------------------------------
HISTFILE=$HOME/.zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
# 同じコマンドをhistoryに残さない
setopt histignorealldups
# 他ターミナルのhistroyの共有
setopt sharehistory
# すでにhistoryにあるコマンドは残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンドをhistoryに残さない
setopt hist_ignore_space
# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# --------------------------------
# completion
# --------------------------------
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ---------------------------
# alias
# --------------------------- 
# bashのshoptコマンドがzshで使えるようにする
alias shopt='/usr/bin/shopt'
