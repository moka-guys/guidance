#!/bin/sh

FILES="$(git ls-files docs)"

for f in $FILES; do
  echo "$f"
    file_modified_string=$(sed -n "/.*last_modified_date:.*/ p" "$f")
    file_modified_date=$(echo "$file_modified_string" | sed 's/^last_modified_date: //')
    printf "\--- Modified date in file: %s \n" "$file_modified_date"
    gitlog_modified_date=$(git log -1 --pretty=format:"%cd" --date=format:'%Y-%m-%d %H:%M:%S' "$f")
    printf "\--- Modified date in git log: %s \n" "$gitlog_modified_date"

    diff=$(($(date -d "$gitlog_modified_date" +%s)-$(date -d "$file_modified_date" +%s)))
    date_diff=$(date -d "@$diff" -u +'%H:%M:%S')
    onemin=$(date -d 00:01:00 +'%H:%M:%S')

    if [ $(date +%s -d "$date_diff") -gt $(date +%s -d "$onemin") ]; then
      datetime_now=$(date +'%Y-%m-%d %H:%M:%S')
      printf "\--- Modified since last pull request \n"
      sed -i "s/.*last_modified_date:.*/last_modified_date: $datetime_now/" "$f"
    else
      printf "\--- File has not been modified \n"
    fi
done


