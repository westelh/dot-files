# Neovim is my favorite editor
set -gx EDITOR nvim

# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Interactive shell configuration
if status is-interactive
    abbr --add nv nvim
    abbr --add vg vagrant
    abbr --add ku kubectl
    abbr --add tf terraform
    abbr --add tm tmux
    abbr --add tree eza --tree
end

#fisher add jethrokuan/fzf
#fisher add IlanCosman/tide
tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time=No --classic_prompt_separators=Vertical --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Sparse --icons='Few icons' --transient=No

# Disable less history file
set -gx LESSHISTFILE '-'

# Homebrew
if command -v brew >/dev/null 2>&1
  eval (/opt/homebrew/bin/brew shellenv)
end

# K9s command completion
if command -v k9s >/dev/null 2>&1
  eval (k9s completion fish)
end

# Pyenv
set -gx PYENV_ROOT $XDG_DATA_HOME/pyenv
pyenv init - | source

# DirEnv
direnv hook fish | source

