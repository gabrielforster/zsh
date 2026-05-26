if command -v fdfind >/dev/null 2>&1; then
  FD_CMD="fdfind"
elif command -v fd >/dev/null 2>&1; then
  FD_CMD="fd"
fi

export FZF_DEFAULT_COMMAND="$FD_CMD --type f --hidden --strip-cwd-prefix"

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if command -v batcat >/dev/null 2>&1; then
  CAT_PREVIEW_CMD="batcat"
else
  CAT_PREVIEW_CMD="bat"
fi

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

export _FZF_PREVIEW_CMD="$CAT_PREVIEW_CMD --color=always --style=plain,numbers --line-range=:500 {}"
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
