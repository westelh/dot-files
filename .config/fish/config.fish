# Interactive shell configuration
if status is-interactive
    # Abbreviations ─ general tooling
    abbr --add ls lse
    abbr --add tm tmux
    abbr --add top htop
    abbr --add tree eza --tree
    abbr --add zj zellij
    abbr --add nv neovide

    # Abbreviations ─ infra/devops
    abbr --add ku kubectl
    abbr --add tf terraform
    abbr --add vg vagrant

    # Abbreviations ─ git & dotfiles
    abbr --add gs git status -s
    abbr --add lg lazygit
    abbr --add ly lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git
    abbr --add ya yadm add
    abbr --add yc yadm commit
    abbr --add cdg cdgitroot

    # Abbreviations ─ clipboard helpers
    abbr --add co pbcopy
    abbr --add pa pbpaste

    # Jenv
    jenv init - | source

    # Pyenv
    if type -q pyenv
      pyenv init - | source
    end

    # DirEnv
    if type direnv -q
      direnv hook fish | source
    end

    # K9s command completion
    if type -q k9s
        eval (k9s completion fish)
    end

    if type -q starship
        function starship_transient_prompt_func
            starship module character
        end

        function starship_transient_rprompt_func
            # Intentionally empty to suppress the transient right prompt.
        end

        starship init fish | source

        if functions -q enable_transience
            enable_transience
        end
    end
end
