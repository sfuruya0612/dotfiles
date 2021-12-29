# Change recentd directory
function change_recent_directory
    set -l recentd (z -l | awk '{ print $2 }' | fzf)

    if test -z "$recentd"
        echo "Directory is not selected."
        return 1
    end

    echo "Change to $recentd"
    cd $recentd
end
