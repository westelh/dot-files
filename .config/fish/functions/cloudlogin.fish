function _aws_login
    aws sts get-caller-identity >/dev/null 2>&1
    or aws login
end

function _gcloud_login
    gcloud auth print-access-token >/dev/null 2>&1
    or gcloud auth login
end

function _oci_login
    oci session validate --local --profile $OCI_CLI_PROFILE >/dev/null 2>&1
    or oci session refresh --profile $OCI_CLI_PROFILE >/dev/null 2>&1
    or oci session authenticate --profile-name $OCI_CLI_PROFILE --region ap-tokyo-1
end

function cloudlogin --description 'AWS/gcloud/OCI へ、切れているものだけログイン'
    _aws_login
    _gcloud_login
    _oci_login
    echo done
end
