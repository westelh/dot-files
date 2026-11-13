# ~/.config/fish/functions/linear-issue-repo.fish
function linear-issue-repo --argument-names id --description 'Issueのrepoラベルに対応するghqのリポジトリを返す（無ければ何も返さない）'
    set -l body (jq -nc --arg id $id '{
        query: "query($id:String!){issue(id:$id){labels{nodes{name parent{name}}}}}",
        variables: {id: $id}
    }')

    set -l label (curl -s https://api.linear.app/graphql \
        -H "Content-Type: application/json" \
        -H "Authorization: "(security find-generic-password -a $USER -s linear-api-key -w) \
        -d $body \
        | jq -r '[.data.issue.labels.nodes[]? | select(.parent.name // "" | ascii_downcase == "repo") | .name][0] // empty')

    test -z "$label"; and return 1
    ghq list | string match -r -- "^[^/]+/"(string escape --style=regex $label)'$'
end