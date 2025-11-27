if status is-login
  set -gx SHELL fish

  # Neovim is my favorite editor
  set -gx EDITOR nvim

  # Disable less history file
  set -gx LESSHISTFILE '-'

  # GPG TTY
  set -gx GPG_TTY (tty)

  # XDG Base Directory Specification
  set -gx XDG_CONFIG_HOME "$HOME/.config"
  set -gx XDG_DATA_HOME "$HOME/.local/share"

  set -gx PYENV_ROOT "$XDG_DATA_HOME/pyenv"

  # N Node version manager
  set -gx N_PREFIX "$XDG_DATA_HOME/n"

  # AWS CLI
  set -gx AWS_CONFIG_HOME "$XDG_CONFIG_HOME/aws"
  set -gx AWS_CONFIG_FILE "$AWS_CONFIG_HOME/config"

  # Ansible
  set -gx ANSIBLE_CONFIG_HOME "$XDG_CONFIG_HOME/ansible"
  set -gx ANSIBLE_CONFIG "$ANSIBLE_CONFIG_HOME/ansible.cfg"

  # Vault CLI
  set -gx VAULT_ADDR https://vault.westelh.dev

  set -gx KUBCONFIG ~/.kube/merged.config
end

