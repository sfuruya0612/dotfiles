# fgp (fzf + gcloud config set project)
# Interactively select a GCP Project
function fgp
    set -l gcpProject (gcloud projects list | fzf --header-lines=1 | awk '{print $1}')

    if test "$gcpProject" = ""
        return 1
    end

    echo "Set GCP project: $gcpProject"
    gcloud config set project $gcpProject
end
