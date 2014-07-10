#!/bin/sh

#  convertToLinux.sh
#  
#
#  Created by Beau Kinstler on 5/1/14.
#  This just changes the program from md5sum to md5, for the mac program.


sed 's/md5sum /md5 /' "fi.sh" > "macfi.sh"
