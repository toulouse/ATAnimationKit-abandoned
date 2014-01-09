#!/bin/bash

pushd $(pwd) > /dev/null    # Save directory state
cd $(dirname $0)            # CD to the script's directory
source _toolincludes.bash   # Add includes
popd > /dev/null            # Restore directory state

for PROJECT_DIR in ${PROJECT_DIRS[@]}; do
    printf "Reformatting files in $(basename $PROJECT_DIR)..."
    FILES=$(find $PROJECT_DIR \( -type d -name Vendor -prune -false \) -o \( -type f -name "*.h" -o -name "*.m" -o -name "*.mm" -o -name "*.c" -o -name "*.hpp" -o -name "*.cpp" \))
    clang-format -style=file -i $FILES
    echo "done"
done
