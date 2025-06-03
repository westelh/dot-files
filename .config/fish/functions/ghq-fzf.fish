function ghq-fzf
  set -l src (ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")

  if test -n "$src"
    set -l dest (ghq root)/$src
    set -l name (string replace -a '.' '_' $src)

    if test -n "$TMUX"
      tmux split-window -h -c $dest
    else
      tmux new-session -d -s $name -c $dest fish
      tmux attach-session -t $name
    end
    commandline -f repaint
  end
end
