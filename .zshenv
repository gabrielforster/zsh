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
typeset -U path   # keep PATH entries unique
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  /usr/local/bin
  $path
)

# Go (system install on Arch, /usr/local/go on Debian/Ubuntu)
if [[ -d /usr/local/go/bin ]]; then
  path=(/usr/local/go/bin $path)
fi
if command -v go >/dev/null 2>&1; then
  path+=("$(go env GOPATH)/bin")
fi

# asdf shims (only when asdf is the active version manager)
if [[ -d "${ASDF_DATA_DIR:-$HOME/.asdf}/shims" ]]; then
  path=("${ASDF_DATA_DIR:-$HOME/.asdf}/shims" $path)
fi

# Rust/cargo binaries (ai-jail etc.)
[[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path)

[[ -d "$HOME/.opencode/bin" ]] && path=("$HOME/.opencode/bin" $path)

export PATH

# Pager for man
if command -v batcat >/dev/null 2>&1; then
    export MANPAGER="batcat -l man -p"
elif command -v bat >/dev/null 2>&1; then
    export MANPAGER="bat -l man -p"
fi

# Startship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
