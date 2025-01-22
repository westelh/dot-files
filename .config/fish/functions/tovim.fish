# https://vim-jp.org/blog/2015/10/15/tovim-on-shell-command-pipes.html

function tovim
  set -f tovimtmp "$(mktemp)"
  trap "rm $tovimtmp" SIGINT

  cat > $tovimtmp
  nvim $tovimtmp < /dev/tty > /dev/tty; and cat $tovimtmp
  rm $tovimtmp
end
