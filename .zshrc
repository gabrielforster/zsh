# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
mkdir -p "${HISTFILE:h}"

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Shell behavior
setopt AUTOCD
setopt NOBEEP
bindkey -e
setopt NUMERIC_GLOB_SORT # sorts file10 after file9, not after file1

# Completion
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# Runtime version manager
# mise (Arch/Omarchy) or asdf (Debian/Ubuntu) — whichever is present
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Smart directory navigation with zoxide
# Initialize zoxide
eval "$(zoxide init zsh)"

# Fuzzy finder with fzf
# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# macOS / Homebrew (Intel)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# Omarchy shell utilities
# Mirrors ~/.bashrc, minus the bash-only bits ($OMARCHY_PATH/default/bash/shell
# and init) — history, completion, mise, starship, zoxide and fzf are already
# set up above in their zsh form. Sourced before the modular files below so the
# personal aliases/functions in this repo win any name collision.
if [[ -n "$OMARCHY_PATH" ]]; then
  source "$OMARCHY_PATH/default/bash/envs"
  source "$OMARCHY_PATH/default/bash/aliases"
  for _omarchy_fn in "$OMARCHY_PATH"/default/bash/fns/*(N); do
    source "$_omarchy_fn"
  done
  unset _omarchy_fn
fi

# Source modular config files
# NOTE: plugins.zsh must load before bindings.zsh — bindings.zsh binds widgets
# (history-substring-search-up/down) that the plugins define.
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/prompt.zsh"

# Machine/work-specific overrides, untracked
[[ -f "$ZDOTDIR/.zshenvwork" ]] && source "$ZDOTDIR/.zshenvwork"

# uv / astral env
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# opencode
export PATH=/home/gabriel/.opencode/bin:$PATH
