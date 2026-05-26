# ZSH Config

## Pre-requirements
1. Install zsh
2. Set global env path on /etc/zsh/zshenv
Set this content on /etc/zsh/zshenv file.
```bash
if [[ -z "$XDG_CONFIG_HOME" ]]
then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```
