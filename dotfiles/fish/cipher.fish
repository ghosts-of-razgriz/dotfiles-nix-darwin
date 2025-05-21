set --export GITLAB_TOKEN "op://Employee/Gitlab/PAT/b5"

set --export GONOPROXY "gitlab.1password.io,go.1password.io"
set --export GONOSUMDB "gitlab.1password.io,go.1password.io"
set --export GOPRIVATE "gitlab.1password.io,go.1password.io"

set --export GOPATH "$HOME/.config/go"

fish_add_path $GOPATH/bin
