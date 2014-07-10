#!/bin/bash          
#echo Hello World $1

# pass a path, or a path and a volume name.
# best to use both
# output will be in the directory where the script is run.


MYPATH="/"
if [ $1 ]; then
  MYPATH=$1
fi

MYVOLUME=""
if [ $2 ]; then
  MYVOLUME=$2
fi

if [ "$MYVOLUME" = "" ]; then
  echo "usage: ./fi.sh <path> <volume name> <file type>"
  exit
fi 

if [ $3 ]; then
    FILETYPE=$3
    echo "looking for file type: $FILETYPE in $MYPATH"
    find -H -P $MYPATH -iname "*.$FILETYPE" | while read p; do
        echo $p
        md5  "$p"  >> ./md5list-$MYVOLUME.txt; done
        exit
else
    # adding this option, to override option to hash all files
    # will use file type list instead.
    IFS=$'\n' read -d '' -r -a  fileTypeArray < "file_types.txt"
    for i in "${fileTypeArray[@]}"
    do
        FILETYPE=$i
        echo "looking for file type: $FILETYPE in $MYPATH"
        find -H -P $MYPATH -iname "*.$FILETYPE" | while read p; do
        echo $p
        md5  "$p"  >> ./md5list-$MYVOLUME.txt; done
    done
    exit
fi
