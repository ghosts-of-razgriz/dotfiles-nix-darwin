set --universal --export FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--border --no-mouse --cycle --prompt='➜ '"

# attach to existing or create a new session
function zell
    set --local session_name (zellij list-sessions | fzf --ansi --bind 'ctrl-space:print-query')
    set --local s $status

    # aborted
    if test "$s" -eq 130
        return
    end

    # make sure a session name is provided
    if test -z "$session_name"
        echo "session name is empty"
        return
    end

    set --local session_name (string split ' ' $session_name)[1]

    zellij attach --create $session_name
end

# delete zellij session
function dzell
    set --local session_name (zellij list-sessions | fzf --ansi --bind 'ctrl-space:print-query')
    set --local s $status

    # aborted
    if test "$s" -eq 130
        return
    end

    # make sure a session name is provided
    if test -z "$session_name"
        echo "session name is empty"
        return
    end

    set --local session_name (string split ' ' $session_name)[1]

    zellij delete-session --force $session_name
end
