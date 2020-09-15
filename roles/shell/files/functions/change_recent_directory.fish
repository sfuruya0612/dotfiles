# Change recentd directory
function change_recent_directory
    set -l recentd (z -l | awk '{ print $2 }' | fzf)
    cd $recentd
end