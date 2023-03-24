#!/bin/bash

# Get the git diff of the last two commits
diff=$(git diff HEAD^ HEAD)

# # Read the JSON file
# json=$(cat file.json)

# Iterate over the diff and check if the path is in the JSON array
# while read -r line; do
#   # Get the path from the diff line
#   path=$(echo "$line" | awk '{print $NF}')
#   echo $path
# done <<< "$diff"

echo "$diff" | while read -r line; do
   path=$(echo "$line" | awk '{print $NF}')
   echo $path
  # Rest of the script
done
