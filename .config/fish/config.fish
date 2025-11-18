set -gx SHELL "fish"

# Neovim is my favorite editor
set -gx EDITOR nvim

# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# GPG TTY
set -gx GPG_TTY (tty)

# Interactive shell configuration
if status is-interactive
    abbr --add nv tmux new -d neovide
    abbr --add vg vagrant
    abbr --add ku kubectl
    abbr --add tf terraform
    abbr --add tm tmux
    abbr --add tree eza --tree
    abbr --add gs git status -s
    abbr --add top htop
    abbr --add lg lazygit
    abbr --add ls lse
    abbr --add ya yadm add
    abbr --add yc yadm commit
    abbr --add co pbcopy
    abbr --add pa pbpaste
    abbr --add ly lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git
    abbr --add cdg cdgitroot
    abbr --add zj zellij
end

# Disable less history file
set -gx LESSHISTFILE '-'

# Homebrew
# MacOS
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end
# Linux
if test -f /home/linuxbrew/.linuxbrew/bin/brew
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
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

# Created by `pipx` on 2025-01-07 15:25:01
set PATH $PATH /Users/taisei/.local/bin

# Start tmux session
#exec tmux new-session -A -s (generate_hfid)

fzf_configure_bindings

# Use default emacs-like bindings
#fish_default_key_bindings
fish_vi_key_bindings

bind -M insert ctrl-q ghq-fzf

set PATH $HOME/.jenv/bin $PATH
status --is-interactive; and jenv init - | source

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  #starship module time
end
starship init fish | source
enable_transience
