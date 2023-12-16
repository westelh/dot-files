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
eval $(/opt/homebrew/bin/brew shellenv)

# K9s command completion
eval (k9s completion fish)

# Pyenv
pyenv init - | source

# Starship
starship init fish | source

# DirEnv
direnv hook fish | source

