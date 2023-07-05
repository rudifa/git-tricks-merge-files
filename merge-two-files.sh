#!/bin/bash

FIRST=$1
SECOND=$2
THIRD=$3

USAGE="usage: $0 <first-file> <second-file> <third-file>
       This script merges the contents of <first-file> and <second-file> into a <third-file>.
       The first two arguments specify the input files, and the third
       argument specifies the output file."

if [ -z "$FIRST" ]; then
    echo "no such file: $FIRST"
    echo "$USAGE"
    exit 1
fi

if [ -z "$SECOND" ]; then
    echo "no such file: $SECOND"
    echo "$USAGE"
    exit 1
fi

if [ -e "$THIRD" ]; then
    echo "file already exists: $THIRD"
    echo "$USAGE"
    exit 1
fi

if [ -z "$FIRST" ] || [ -z "$SECOND" ] || [-e $THIRD]; then
    echo
    exit 1
fi

git checkout -b "rename-$SECOND"
git mv "$SECOND" "$THIRD"
git commit -m "rename $SECOND to $THIRD"

git checkout -
git mv "$FIRST" "$THIRD"
git commit -m "rename $FIRST to $THIRD"

git merge -m "combine $FIRST and $SECOND" "rename-$SECOND"

git cat-file --filters HEAD:"$THIRD" >"$THIRD"
git cat-file --filters "rename-$SECOND:$THIRD" >>"$THIRD"
git add "$THIRD"
git merge --continue
git branch -d "rename-$SECOND"
