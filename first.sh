#!/bin/bash
echo Hello World
directory=$(pwd)
args="Twoja $1"

echo "You are currently in $directory"
echo $args
if [[ $# -lt 2 ]]; then
  echo "Small params"
fi

