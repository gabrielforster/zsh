# Modern cli replacements
alias ls="eza --icons"
alias ll="eza -lh --icons --git"
alias la="eza -lah --icons --git"
alias tree="eza --tree --icons"


# Better cat command (bat on Arch, batcat on Debian/Ubuntu)
alias basecat="$(which cat)"
if command -v bat >/dev/null; then
  alias cat="bat"
elif command -v batcat >/dev/null; then
  alias bat="batcat"
  alias cat="batcat"
fi


# fd (fdfind on Debian/Ubuntu)
if command -v fdfind >/dev/null; then
  alias fd="fdfind"
fi


# Core utils
alias grep="rg --color=auto"
alias diff="diff --color=auto"
alias df="df -h"

# Keyboard layout + clipboard: Wayland (Hyprland) vs X11
if [[ -n "$WAYLAND_DISPLAY" ]]; then
  alias ptbr="hyprctl keyword input:kb_layout br"
  alias enus="hyprctl keyword input:kb_layout us"
  alias copy="wl-copy"
  alias paste="wl-paste"
else
  alias ptbr="setxkbmap br"
  alias enus="setxkbmap us"
  alias copy="xclip -sel clip"
  alias paste="xclip -sel clip -o"
fi

# Editor
alias vim="nvim"


# Git
alias glog='PAGER="less -F -X" git log'
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias gst="git status"
alias dotfiles="git --git-dir='$HOME'/.dotfiles --work-tree='$HOME'"


# Tmux session manager
alias ts='~/.config/scripts/tmux-sessionizer.sh'


# Herdr session manager
alias hs='~/.config/scripts/herdr-sessionizer.sh'


# background setter: omarchy manages wallpapers on Wayland, feh on X11
if command -v omarchy-theme-bg-next >/dev/null 2>&1; then
  alias bgnext='omarchy theme bg next'
  alias fehbg='omarchy theme bg next'
else
  alias fehbg='~/.config/scripts/fehbg'
fi


# Node
# pnpm
alias pn="pnpm"
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# Python
alias python="python3"
alias pip="pip3"
