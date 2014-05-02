#!/bin/sh

#  convertToLinux.sh
#  
#
#  Created by Beau Kinstler on 5/1/14.
#


sed 's/md5sum /md5 /' "fi.sh" > "macfi.sh"