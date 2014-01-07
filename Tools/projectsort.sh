#!/bin/sh
export REPO_ROOT=$HOME/code/AT
$REPO_ROOT/Tools/sort-Xcode-project-file.pl $REPO_ROOT/ATAnimationKit/ATAnimationKit.xcodeproj/project.pbxproj $REPO_ROOT/ATBase/ATBase.xcodeproj/project.pbxproj $REPO_ROOT/ATAnimationKitExample/ATAnimationKitExample.xcodeproj/project.pbxproj
