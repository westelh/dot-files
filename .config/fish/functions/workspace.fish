function workspace
  set -l ghq_root (ghq root)
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
    set -l ghq_root_regex (string escape --style=regex -- $ghq_root)
    set -l pattern "^$ghq_root_regex(/|\$)"
    if string match -rq -- $pattern $git_root
      set -l name (basename (dirname $git_root))'/'(basename $git_root)
      set -l session_name (string replace '/' '-' $name)
      zellij attach --create "ws-$session_name" options --default-cwd "$git_root"
      return
    else
      set -l name (basename $git_root)
      set -l session_name (string replace -a ' ' '-' $name)
      zellij attach --create "ws-anonymous-$session_name" options --default-cwd "$git_root"
      return
    end
  else
    set -l path $ghq_root/(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $ghq_root/{}/README.*")
    set -l name (basename (dirname $path))'/'(basename $path)
    set -l session_name (string replace '/' '-' $name)
    zellij attach --create "ws-$session_name" options --default-cwd "$path"
  end
end
