#!/bin/bash


MBUCKET_BASE_URL="https://mbucket.datarespons.com/scm/"
BASE_URL="https"://github.com/data-respons-rdservices/ 



MBUCKET_PROJECT_NAME="not"
PROJECT_NAME="15331_TechnipFMC_780483_FPM207-v10DevelopmentProject"
bitbucket_names=("parts")
github_names=("")




LARGE_FILE_NAMES=(
  "sw/toolchain/toolchain.tar.gz"
  "sw/images/rootfs.ext2"
  "sw/images/rootfs.ext2"
  "sw/toolchain/toolchain.tar.gz"
  "sw/toolchain/toolchain.tar.gz"
  "sw/images/rootfs.ext2"
  "sw/images/rootfs.ext2"
)


branches=(
  "enable_cvo_control_port_test"
)
commit_message="Start tracking large file with Git LFS. This is nesesary when moving the repo from bitbucket to github. Nothing else should be changed"



# for name in "${repo_names[@]}"; do
github_repo_name=$PROJECT_NAME$github_names
github_repo_url=$BASE_URL$github_repo_name
mbucket_url=$MBUCKET_BASE_URL$MBUCKET_PROJECT_NAME/$bitbucket_names".git"

INCLUDE_STRING=$(IFS=","; echo "${LARGE_FILE_NAMES[*]}")


echo ""
echo "git clone $mbucket_url"
echo cd $bitbucket_names
echo git remote set-url --push origin  $github_repo_url
echo git fetch --tags

echo 
for file_name in "${LARGE_FILE_NAMES[@]}"; do
  echo git lfs track \"$file_name\"
done
echo git add .
echo git commit -m \"$commit_message\"
echo git add --renormalize .
echo git lfs migrate import --everything --include=\"$INCLUDE_STRING\"
echo git add --renormalize .

echo git push
# echo git push --tags


for branch in "${branches[@]}"; do
  echo
  echo git checkout $branch
  for file_name in "${LARGE_FILE_NAMES[@]}"; do
    echo git lfs track \"$file_name\"
  done
  echo git add .
  echo git commit -m \"$commit_message\"
  echo git add --renormalize .
  echo git lfs migrate import --everything --include=\"$INCLUDE_STRING\"
  echo git add --renormalize .
  echo git push

done

echo git push --tags



echo 
echo cd /home/andreas/KUP_Move_repos

  



