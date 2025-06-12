function cdgitroot
  set -f gitroot (git rev-parse --show-toplevel 2> /dev/null)
  if test -n "gitroot"
    echo "Not a git directory"
  else
    cd $gitroot
  end
end
