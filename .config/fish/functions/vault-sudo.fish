function vault-sudo
  if test -n "$VAULT_TOKEN"
    echo "Warning: VAULT_TOKEN is already set."
    set -s VAULT_TOKEN
  end

  set -f OP_ITEM 'Vault AppRole "sudoer"'
  set -f OP_FIELD 'auth/approle/login'
  op item get $OP_ITEM --fields=$OP_FIELD --format=json | \
    jq .value -r | read -f PARAMS
  if test ! $status -eq 0
    echo "Failed to get AppRole parameters."
    return
  end

  echo $PARAMS | vault write -f auth/approle/login - --format=json | \
    jq .auth.client_token -r | \
    read -fx VAULT_TOKEN
  if test $status -eq 0
    vault $argv
  else
    echo "Failed to acquire Vault token."
  end
end
