# https://app.terraform.io/app/westelh/workspaces/parrot-oke-stg
function open_tf_workspace
  set -l organization "westelh"
  if test -n "$argv"
    set -l workspace "$argv"
  else
    set -l workspace ( terraform workspace get )
  end
  set -l url "https://app.terraform.io/app/$organization/workspaces/$workspace"
  open $url
end
