#!/bin/sh

#  convertToLinux.sh
#  
#
#  Created by Beau Kinstler on 5/1/14.
#


sed 's/md5 /md5sum /' "fi.sh" > "fi.sh"