# Apply default apps listed in ~/.config/default-apps (macOS only)
# Each line is passed to `utiluti type set`, e.g. `--ext tf com.neovide.neovide`

function set_default_apps
  xargs -L1 utiluti type set < ~/.config/default-apps
end
