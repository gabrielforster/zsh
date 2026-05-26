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
alias ptbr="setxkbmap br"
alias enus="setxkbmap us"
alias copy="xclip -sel clip"

# Editor
alias vim="nvim"


# Git
alias glog='PAGER="less -F -X" git log'
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias gst="git status"


# Tmux session manager
alias ts='~/.config/scripts/tmux-sessionier.sh'


# background setter
alias fehbg='~/.config/scripts/fehbg'


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
