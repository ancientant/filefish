#!/bin/sh

#  Mac_Results_to_csv.sh
#  
#
#  Created by Beau  on 5/2/14.
#


#!/bin/bash
# Argument = -t test -r server -p password -v

#SET DEFAULT LOCATION
DEFAULTLOCATION="~/"
OUTPUTFILENAME="filefish_output.csv"
usage()
{
cat << EOF
usage: $0 options

OPTIONS:
  -h      Show this message
  -o      Output location.  Defualts to $DEFAULTLOCATION
  -i      Inputput file.  [Required]
EOF
}

OUTLOCATION=$DEFAULTLOCATION
INLOCATION=

while getopts “:ho:i:” OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    o)
      OUTLOCATION="$OPTARG"
      ;;
    i)
      INLOCATION="$OPTARG"
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

if [[ -z $INLOCATION ]]
then
  usage
  exit 1
fi

if [[ -z $OUTLOCATION ]]
then
  outlocation="$DEFAULTLOCATION"
fi

sed -e 's/MD5 (/"/' -e 's/) =/",/' "$INLOCATION" > "$OUTLOCATION$OUTPUTFILENAME"
