# Setting GPG_TTY for git commit signing
export GPG_TTY=$(tty)

# Default Prompt
PS1="%n@%m %1~ %# "

# Options
autoload -U colors && colors # Enable colors
setopt autocd # cd without typing 'cd'
setopt correct # Correct typos in directory names
setopt hist_ignore_all_dups # Prevent duplicate entries in history
setopt share_history # Share history across terminals
bindkey -e # Emacs keys

# History settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Auto-completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Plugin-manager Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load configs
[ -f "$HOME/.config/shell/.aliasrc" ]   && source "$HOME/.config/shell/.aliasrc"
[ -f "$HOME/.config/zsh/.zplugins" ]    && source "$HOME/.config/zsh/.zplugins"
