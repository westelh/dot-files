function open_tf_workspace
  set -f organization "westelh"

  if test -n "$argv"
    set -f workspace "$argv"
  else
    set -f workspace ( terraform workspace show)
  end

  set -f url "https://app.terraform.io/app/$organization/workspaces/$workspace"
  echo "Opening $url"
  open $url
end
