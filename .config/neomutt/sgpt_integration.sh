#!/bin/sh

if [ -n $TMUX ]; then
  tmpfile="/tmp/neomutt_sgpt_integration_tmp_$TMUX_PANE"
  cat ~/.config/neomutt/sgpt_prompt.txt > $tmpfile
  echo '---mail separator---' >> $tmpfile
  cat - >> $tmpfile
  tmux display-popup -E "sgpt --model gpt-4o-mini $prompt < $tmpfile; read -n1"
else
  echo "Error: tmux is not running."
fi
