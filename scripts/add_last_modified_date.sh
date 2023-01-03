#!/bin/sh

FILES="$(git ls-files docs)"

for f in $FILES; do
  echo "$f"
    file_modified_date=$(sed -n "/.*last_modified_date:.*/ p" "$f")
    printf "\--- Modified date in file: %s \n" "$file_modified_date"
    str="$(git log -1 --pretty=format:"%cd" --date=format:'%Y-%m-%d %H:%M:%S' "$f")"
    printf "\--- Modified date in git log: %s \n" "$str"
    if echo "$file_modified_date" | grep -q "$str"; then
      printf "\--- File has not been modified \n"
    else
      datetime_now=$(date +'%Y-%m-%d %H:%M:%S')
      printf "\--- Modified since last pull request: %s \n" "$str"
      sed -i "s/.*last_modified_date:.*/last_modified_date: $datetime_now/" "$f"
    fi
done


