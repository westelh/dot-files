function vault-sudo
  if test $status -eq 0
    eval "vault-sudo-env vault $argv"
  else
    echo "Failed to acquire Vault token."
  end
end
