# ~/.config/zsh/.zshenv


# Centralized XDG (config, cache, data) directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


# Editor
export EDITOR="nvim"
export VISUAL="nvim"

#
# Gpg
export GPG_TTY=$(tty)


# Path
# Personal binaries/scripts
PATH=$PATH
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/bin:/usr/local/go/bin:$PATH
PATH=$HOME/neovim/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$PATH:$(go env GOPATH)/bin
PATH=$PATH:$HOME/.asdf/installs/rust/1.88.0/bin/
PATH=$HOME/.asdf/installs/nodejs/24.14.0/bin:$PATH
PATH=$HOME/.opencode/bin:$PATH

export PATH

# Pager for man
if command -v batcat >/dev/null 2>&1; then
    export MANPAGER="batcat -l man -p"
else
    export MANPAGER="bat -l man -p"
fi

# Startship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
