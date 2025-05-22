#!/bin/bash

if ! command -v speedtest-cli >/dev/null 2>&1 ; then
    echo "No speedtest-cli installed" && exit 1
fi

result=$(speedtest-cli)

now=$(date +"%Y-%m-%d %H:%M:%S")

file_line="$(grep "Download" <<< $result) , $(grep "Upload" <<< "$result") at $now"

echo "$file_line" >> "scores.txt"
