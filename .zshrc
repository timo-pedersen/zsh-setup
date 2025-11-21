#### Basics ####

# Use UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History: big, shared, and not stupid
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY      # Write history immediately
setopt SHARE_HISTORY           # Share history across sessions
setopt HIST_IGNORE_DUPS        # Don't record immediate duplicates
setopt HIST_IGNORE_ALL_DUPS    # Drop older dupes too
setopt HIST_REDUCE_BLANKS      # Strip extra spaces
setopt HIST_VERIFY             # Don't run expanded history immediately
setopt EXTENDED_HISTORY        # Timestamped history

#### Globbing / matching ####

setopt EXTENDED_GLOB           # Enables **, qualifiers etc.
setopt GLOB_DOTS               # Include dotfiles in globs

# Case-insensitive, smart completion
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# fzf keybindings and completion (Arch paths)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

#### Keybindings ####

# Emacs-style (Ctrl-A/E, etc.) – comment this and uncomment the vi line if you want vi-mode
bindkey -e

# Vi-style line editing (NORMAL/INSERT modes in the prompt)
#bindkey -v

# Ctrl-Left / Ctrl-Right → move by word
# Common xterm/WezTerm sequences
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Some terminals use these instead
bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word

# Fix Home / End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Some terminals send these instead:
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# Fix Delete
bindkey '^[[3~' delete-char

# Fix Insert (toggle overwrite mode)
# bindkey '^[[2~' overwrite-mode

# INS key opens neovim for cmd line
export EDITOR=nvim
export VISUAL=nvim

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^[[2~' edit-command-line

bindkey '^?' backward-delete-char


#### Aliases ####

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -la --color=auto'
alias l='ls --color=auto'
alias git='/mnt/c/program\ files/git/bin/git.exe'

# Fuzzy cd into a directory
fcd() {
  local dir
  dir=$(find ${1:-.} -type d 2>/dev/null | fzf) || return
  cd "$dir"
}

# Fuzzy open a file in nvim
fe() {
  local file
  file=$(find ${1:-.} -type f 2>/dev/null | fzf) || return
  nvim "$file"
}


#### Enable colored output for ls and friends
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
eval "$(dircolors -b)"

#### Starship prompt ####

eval "$(starship init zsh)"

