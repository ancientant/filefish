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
    md5sum  "$p"  >> /fitool/md5list-$MYVOLUME.txt; done
  exit
else
  echo "looking for all file types in $MYPATH"
  find -H -P "$MYPATH" | while read p; do  
    md5sum  "$p"  >> /fitool/md5list-$MYVOLUME.txt; done
  exit
fi
  

EOF
