function ghq-fzf
  set -l src (ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if test -n "$src"
    cd (ghq root)/$src
  end
end
