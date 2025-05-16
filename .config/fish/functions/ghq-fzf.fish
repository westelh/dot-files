function ghq-fzf
  set -l src (ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if test -n "$src"
    set -l name (string replace -a '.' '_' $src)
    tmux new-session -d -s $name -c (ghq root)/$src fish
    tmux attach-session -t $name
    commandline -f repaint
  end
end
