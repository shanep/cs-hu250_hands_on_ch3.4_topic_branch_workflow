#!/bin/bash

function append_and_commit()
{
    local branch_name=$( echo $1 | cut -d'-' -f2 )
    local file_name_to_be_appended_and_committed="index_${branch_name}.html"
    local file_content=$1
    local commit_message=$1

    git checkout $branch_name

    echo $file_content >> $file_name_to_be_appended_and_committed

    git add $file_name_to_be_appended_and_committed

    git commit -m "$commit_message"

    sleep 1
}

master="master"
iss91="iss91"
iss91v2="iss91v2"
dumbidea="dumbidea"

append_and_commit "C1-${master}"

git branch $iss91

append_and_commit "C2-${iss91}"

append_and_commit "C3-${master}"

append_and_commit "C4-${iss91}"

git branch $iss91v2

append_and_commit "C5-${iss91}"

append_and_commit "C6-${iss91}"

append_and_commit "C7-${iss91v2}"

append_and_commit "C8-${iss91v2}"

append_and_commit "C9-${master}"

append_and_commit "C10-${master}"

git branch $dumbidea

append_and_commit "C11-${iss91v2}"

append_and_commit "C12-${dumbidea}"

append_and_commit "C13-${dumbidea}"

echo "$0 completed!"
