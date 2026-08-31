# must be registered via this hook to survive.

# Ctrl+Right -> move forward one word (^[[1;5C is the terminal escape code)
bindkey '^[[1;5C' forward-word

# Ctrl+Left -> move backward one word (^[[1;5D is the terminal escape code)
bindkey '^[[1;5D' backward-word

# Ctrl+F -> fzf file picker (no hidden files)
bindkey '^F' _fzf_file_no_hidden

# Up/Down -> history search by substring (^[[A/^[[B are up/down arrow escape codes)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

zle -N backward-kill-dir
bindkey '^W' backward-kill-dir

# Delete / Insert / Home / End -> zsh's emacs keymap binds none of these, and
# ZLE self-inserts the tail of an unmatched escape sequence: Delete typed "~",
# Shift+Delete typed ";2~". /etc/zshrc normally adds them, but $ZDOTDIR skips it.
bindkey '^[[3~'   delete-char       # Delete
bindkey '^[[3;2~' delete-char       # Shift+Delete
bindkey '^[[3;5~' kill-word         # Ctrl+Delete
bindkey '^[[2~'   overwrite-mode    # Insert
bindkey '^[[H'    beginning-of-line # Home, normal cursor mode
bindkey '^[[F'    end-of-line       # End, normal cursor mode
bindkey '^[OH'    beginning-of-line # Home, application cursor mode
bindkey '^[OF'    end-of-line       # End, application cursor mode

# Same keys again from terminfo, so a terminal that reports different sequences
# still works (matches the Up/Down handling above).
[[ -n ${terminfo[kdch1]} ]] && bindkey "${terminfo[kdch1]}" delete-char
[[ -n ${terminfo[khome]} ]] && bindkey "${terminfo[khome]}" beginning-of-line
[[ -n ${terminfo[kend]}  ]] && bindkey "${terminfo[kend]}"  end-of-line
