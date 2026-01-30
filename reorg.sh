#!/bin/bash
# Loop through all directories in the current location
for d in */ ; do
    # Enter the directory
    cd "$d" || continue
    # Check if it contains a .git folder before running commands
    echo "---------------------------------"
    echo "Processing repo: $d"
    # Git commands
    git add .
    # Only commit if there are changes to avoid empty commit errors
    git commit -m "reorg" || echo "Nothing to commit in $d"
    git push
    # Return to the parent directory
    cd ..
done
