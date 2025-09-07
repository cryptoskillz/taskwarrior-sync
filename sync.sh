#!/bin/bash

# Get the first argument
ACTION=$1

if [[ "$ACTION" == "push" ]]; then
    echo "You chose push"
    task export > tasks.json
    #will only be used once the first time you track. 
    git add tasks.json
    git commit -a -m 'latest hacks'
    git push github main
    

elif [[ "$ACTION" == "pull" ]]; then
    echo "You chose pull"
    # Do pull-related stuff here
    git pull github main
    tasks import tasks.json

else
    echo "Usage: $0 {push|pull}"
    exit 1
fi
