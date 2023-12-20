function dev
  set -f sessions (tmux list-sessions -F "#{session_name}")
  if contains "$argv" $sessions -c $HOME/Documents/dev
    tmux attach-session -t $argv
  else
    tmux new-session -s $argv -c $HOME/Documents/dev \; splitw
  end
end
