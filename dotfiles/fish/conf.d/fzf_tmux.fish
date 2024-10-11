function tm
    set --local session (tmux list-sessions 2> /dev/null | fzf-tmux --ansi --print-query)
    set --local s $status

    # aborted
    if test "$s" -eq 130
        return
    end

    if string match --quiet "*:*" $session
        set session (string match -r '[^ ]+(?=:)' -- $session)
    end

    if tmux has-session -t "$session" >/dev/null 2>&1
        if test -n "$TMUX"
            tmux switch-client -t "$session"
        else
            tmux attach-session -t "$session"
        end
    else
        if test -n "$TMUX"
            tmux new-session -ds "$session"
            tmux switch-client -t "$session"
        else
            tmux new-session -s "$session"
        end
    end
end
