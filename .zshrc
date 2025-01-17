[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(/opt/homebrew/bin/brew shellenv)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

if command -v tmux > /dev/null 2>&1; then
  if [ -n "$TMUX" ]; then
    echo "We are already in a tmux session. Continue with zsh itself instead of starting a new tmux user session."
  else
    # Check if tmux session named 'default' exists
    tmux list-sessions | grep -q "^default:"

    # If 'default' session exists
    if [[ $? -eq 0 ]]; then
      echo "Session 'default' already exists. Attaching to it."
      tmux attach-session -t default

    # If 'default' session does not exist
    else
      exec tmux new-session -s default -n fish
    fi
  fi
else
  echo "Command not found: tmux; Continue without starting tmux"
fi
