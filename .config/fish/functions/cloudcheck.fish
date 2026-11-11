function cloudcheck
    aws sts get-caller-identity >/dev/null 2>&1; or echo "AWS: 要ログイン"
    gcloud auth print-access-token >/dev/null 2>&1; or echo "gcloud: 要ログイン"
    oci session validate --local --profile $OCI_CLI_PROFILE >/dev/null 2>&1; or echo "OCI: 要ログイン"
end