#!/bin/bash

# Get git diff of last 2 commits
DIFF=$(git diff HEAD^..HEAD)

# Read JSON file into an array
PROJECTS=$(cat projects.json | jq -c '.[]')

# Iterate over diff and check if path contains in the JSON array object
while read -r line; do
  # Get file path from diff line
  FILE_PATH=$(echo $line | awk '{print $NF}')

  # Iterate over JSON array and check if any object's path contains the file path
  while IFS= read -r project; do
    PROJECT_PATH=$(echo $project | jq -r '.Path')
    if [[ $FILE_PATH == *$PROJECT_PATH* ]]; then
      # File path contains project path, do something
      PROJECT_NAME=$(echo $project | jq -r '.project')
      echo "$FILE_PATH is part of project $PROJECT_NAME"
    fi
  done <<< "$PROJECTS"
done <<< "$DIFF
