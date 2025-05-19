function k9
  if test -n "$TMUX"
    tmux display-popup -E \
      -w "$(tmux display -p '#{window_width} * 80 / 100' | bc)" \
      -h "$(tmux display -p '#{window_height} * 80 / 100' | bc)" \
      "k9s"
  else
    k9s
  end
end
