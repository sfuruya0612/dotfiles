# gcb (git checkout + fzf)
# Interactively select and chenge git branch
function gcb
    set -l branch (
        git --no-pager branch -a | grep -v HEAD | sed -e "s/^.* //g" \
        | fzf --preview "git --no-pager log -20 -p --color=always {}"
    )

    if test -n "$branch"
        git checkout (echo "$branch" | sed "s#remotes/[^/]*/##")
    end
end
