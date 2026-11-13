function linear-api --description 'Linear GraphQLを叩く。'
    set -l query $argv[1]
    set -l vars '{}'
    test (count $argv) -ge 2; and set vars $argv[2]

    curl -s https://api.linear.app/graphql \
        -H "Content-Type: application/json" \
        -H "Authorization: "(security find-generic-password -a $USER -s linear-api-key -w) \
        -d (jq -nc --arg q $query --argjson v $vars '{query:$q,variables:$v}')
end
