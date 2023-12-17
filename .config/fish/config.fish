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
if command -v pyenv >/dev/null 2>&1
  pyenv init - | source
end

# DirEnv
if command -v direnv >/dev/null 2>&1
  direnv hook fish | source
end

