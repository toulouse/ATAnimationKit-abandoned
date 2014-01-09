#!/bin/bash

pushd $(pwd) > /dev/null    # Save directory state
cd $(dirname $0)            # CD to the script's directory
source _toolincludes.bash   # Add includes
popd > /dev/null            # Restore directory state

for PROJECT in ${PROJECTS[@]}; do
    printf "Sorting $(basename $(dirname $PROJECT))..."
    $SORT_SCRIPT $PROJECT/project.pbxproj
    echo "done"
done
