[[ -r ~/.zprofile ]] && source ~/.zprofile
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

