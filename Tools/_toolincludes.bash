# From anywhere, get the directory above the one the calling script is in
pushd $(pwd) > /dev/null    # Save directory state
cd ..                       # CD to the parent directory
PROJECT_ROOT=$(pwd)         # Save the current logical directory
popd > /dev/null            # Restore directory state

SORT_SCRIPT=$PROJECT_ROOT/Tools/sort-Xcode-project-file.pl

PROJECT_DIRS=()
PROJECTS=()

while read -r line; do
KEY=${line%%:*}
VALUE=${line#*:}
PROJECT_DIRS+=("$PROJECT_ROOT/$KEY")
PROJECTS+=("$PROJECT_ROOT/$KEY/$VALUE")
done < $PROJECT_ROOT/_projects
