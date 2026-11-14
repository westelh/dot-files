# ~/.config/fish/functions/linear-open.fish
function linear-open --argument-names id --description 'Linear Issueをデスクトップアプリで開く。IDを省略するとブランチ名かワークツリーのパスから推定する'
    if test -z "$id"
        # lcc のワークツリー（.claude/worktrees/nis-123）とブランチ（claude/nis-123-xxx）にIDが入る
        # Zellijのキーから起動したときはcwdがワークツリーにならないので、同じタブでフォーカスしているペインの
        # タイトル（claude -n の名前）とコマンド（--worktree nis-123）からも探す
        set -l pane
        if set -q ZELLIJ
            set -l tab_id (zellij action current-tab-info 2>/dev/null | string replace -rf '^id: ' '')
            set pane (zellij action list-panes -a -j 2>/dev/null | jq -r --argjson tab "$tab_id" --arg self "$ZELLIJ_PANE_ID" '
                .[] | select(.tab_id == $tab and .is_focused and (.is_plugin | not) and (.is_floating | not) and (.id | tostring) != $self)
                | .title, (.pane_command // empty)')
        end
        for s in (git branch --show-current 2>/dev/null) (git rev-parse --show-toplevel 2>/dev/null) $PWD $pane
            set id (string match -rgi -- '\b([a-z]+-[0-9]+)\b' $s)[1]
            test -n "$id"; and break
        end
    end
    if test -z "$id"
        echo "usage: linear-open [ISSUE-ID]（ブランチ名・パスからIDを推定できませんでした）" >&2
        return 2
    end
    set id (string upper -- $id)

    set -l url (linear-api 'query($id:String!){issue(id:$id){url}}' (jq -nc --arg id $id '{id:$id}') \
        | jq -r '.data.issue.url // empty')
    if test -z "$url"
        echo "linear-open: $id が見つかりません" >&2
        return 1
    end
    # https://linear.app/<workspace>/issue/... を linear:// に置き換えるとデスクトップアプリで開く
    open (string replace -- 'https://linear.app/' 'linear://' $url)
end
