function cdgitroot
  if set path (git rev-parse --show-toplevel 2>/dev/null)
    cd $path
  end
end
