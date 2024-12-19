#!/bin/bash

MBUCKET_BASE_URL="https://mbucket.datarespons.com/scm/"
BASE_URL="https"://github.com/data-respons-rdservices/ 

MBUCKET_PROJECT_NAME="not"
PROJECT_NAME="15331_TechnipFMC_780483_FPM207-v10DevelopmentProject"
bitbucket_names=("parts")
github_names=("")




for ((i=0; i<${#bitbucket_names[@]}; i++)); do
  bitbucket_name=${bitbucket_names[$i]}
  github_name=${github_names[$i]}
  
  github_repo_name=$PROJECT_NAME$github_name
  github_repo_url=$BASE_URL$github_repo_name
  mbucket_url=$MBUCKET_BASE_URL$MBUCKET_PROJECT_NAME/$bitbucket_name".git"
  
  echo
  echo "### Github Repo bitbucket_name ###"
  echo $github_repo_name 
done
echo
echo
for ((i=0; i<${#bitbucket_names[@]}; i++)); do
  bitbucket_name=${bitbucket_names[$i]}
  github_name=${github_names[$i]}

  github_repo_name=$PROJECT_NAME$github_name
  github_repo_url=$BASE_URL$github_repo_name
  mbucket_url=$MBUCKET_BASE_URL$MBUCKET_PROJECT_NAME/$bitbucket_name".git"

  echo ""
  echo "git clone --mirror $mbucket_url"
  echo cd $bitbucket_name".git"
  echo git remote set-url --push origin  $github_repo_url
  echo git push --mirror
  echo cd /home/andreas/KUP_Move_repos
  echo 

done
  

echo
echo source make_commands.sh 


# git remote add origin https://github.com/data-respons-rdservices/15331_TechnipFMC_780483_FPM207-v10DevelopmentProjectParts.git
# git remote -v