#!/usr/bin/env bash
echo "cokolwiek"

dir=${1:-plecak}
file_content=$(cat sprzet)
# klamerki i podwójne nawiasy
#argumenty dzielimy spacją
if [[ -d $dir ]]
    then
    echo "istnieje"
else
    mkdir "$dir"
fi

counter=0
for item in $file_content; do
    rm -rf "$dir/$item"
    if [[ $((counter % 2)) -eq 0 ]]
    then
        touch "$dir/$item"
    else
        mkdir "$dir/$item"
    fi
    counter=$((counter+1))
done

echo "$(date -I) Utworzyłem $counter plików"
