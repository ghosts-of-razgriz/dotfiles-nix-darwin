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
