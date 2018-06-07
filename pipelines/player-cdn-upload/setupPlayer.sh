#!/bin/sh

set -ex

commit_ref=${1:-release-1.7}
player_dir=sunbird-portal
[ -d $sunbird_devops_dir_name ] || git clone https://github.com/project-sunbird/$sunbird_devops_dir_name -b $commit_ref && exit 0
[ -d sunbird-player ] || git clone https://github.com/project-sunbird/sunbird-player -b angular-migration && exit 0
cd $sunbird_devops_dir_name
git reset --hard
git clean -fd
git fetch
git checkout "$commit_ref"
git pull -X theirs
