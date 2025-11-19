function workspace
  set -l ghq_root (ghq root)
  set -l ghq_root_regex (string escape --style=regex -- $ghq_root)
  set -l pattern "^$ghq_root_regex(/|\$)"

  # If it is a git repository
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)

    # If it is managed by ghq
    if string match -rq -- $pattern $git_root
      set -f path $git_root
      set -f name (basename (dirname $git_root))'/'(basename $git_root)
    # If it is not managed by ghq
    else
      set -f path $git_root
      set -f name (basename $git_root)
    end

  # If it is not a git repository
  else
    set -f path $ghq_root/(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $ghq_root/{}/README.*")
    set -f name (basename (dirname $path))'/'(basename $path)
  end


  set -l session_name "ws-$(string replace '/' '-' $name)"

  if test -z $ZELLIJ
    zellij attach --create $session_name options --default-cwd "$path"
  else
    if test $session_name = $ZELLIJ_SESSION_NAME
      echo "You are already in the workspace."
    else
      zellij attach --create-background $session_name options --default-cwd "$path"
      echo "Switching session is not supported. Switch manually to \"$session_name\""
    end
  end
end
