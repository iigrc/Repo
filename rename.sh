#!/bin/bash/
#REpaces the file extrnsion
#Usage: rename.sh filena extension


filename=${1:?Please enter the filename}
extension=${2:?Please enter the extension}
filenameonly=${filename%%.*}
timestamp=$(date +%Y%m%d)
mv $filename ${filenameonly}.${extension}.${timestamp}
