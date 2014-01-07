#!/bin/sh
export REPO_ROOT=$HOME/code/AT
export FILES=`find $REPO_ROOT \( -type d -path $REPO_ROOT/Vendor -prune -false \) -o \( -type f -name "*.h" -o -name "*.m" -o -name "*.mm" -o -name "*.c" -o -name "*.hpp" -o -name "*.cpp" \)`
clang-format -style=file -i $FILES
