# ecr
# Docker login to AWS ECR
function ecr
    set -l profile (grep "\[profile" ~/.aws/config | sed 's/^\[profile\ \(.*\)\]$/\1/g' | grep -v "#" | fzf)

    set -l region (aws configure get region --profile $profile)

    set -l account_id (aws sts get-caller-identity --profile $profile | jq -r '.Account')

    set -l registry_url "$account_id.dkr.ecr.$region.amazonaws.com"

    set -l login_cmd "aws ecr get-login-password --profile $profile --region $region \
        | docker login --username AWS --password-stdin $registry_url"

    eval $login_cmd
    echo "Logged in to ECR at $registry_url"
end
