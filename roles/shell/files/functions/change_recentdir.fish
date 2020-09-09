# Change recentd directory
function change_recentdir
    set -l recentd (z -l | awk '{ print $2 }' | fzf)
    cd $recentd
end