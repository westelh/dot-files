# ~/.config/fish/functions/claude-issue.fish
function claude-issue --description 'Linear IssueのrepoラベルのリポジトリでClaude Codeを起動する'
    if test (count $argv) -lt 1
        echo "usage: claude-issue ISSUE-ID [claude options...]" >&2
        return 2
    end
    set -l id $argv[1]
    set -l rest $argv[2..]

    set -l repo (linear-issue-repo $id)[1]
    if test -z "$repo"
        echo "claude-issue: $id に対応するリポジトリが見つかりません（Issueが無いか、Repoラベルが未設定）" >&2
        return 1
    end

    # セッション名（Zellijのタブ名にもなる）は「ID 短縮タイトル」にする。取得できなければIDのみ
    set -l title (linear-api 'query($id:String!){issue(id:$id){title}}' (jq -nc --arg id $id '{id:$id}') \
        | jq -r '.data.issue.title // empty')
    set -l name $id
    test -n "$title"; and set name "$id "(string shorten --max 16 -- $title)

    pushd (ghq root)/$repo; or return
    claude -n "$name" $rest "Linear の $id に取り組んでください。まず Linear MCP で Issue の内容とコメントを確認してから計画を立ててください。"
    set -l st $status
    popd
    return $st
end
