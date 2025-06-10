function lse -w eza
  set -fx EZA_ICONS_AUTO

  git rev-parse --show-toplevel &> /dev/null
  if test $status -eq 0
    # cwd is git repository
    eza --long --git --no-permissions --no-filesize --no-user --no-time $argv
  else
    eza $argv
  end
end
