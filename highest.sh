#!/bin/bash
filename=${1:?Please enter the filename}
count=${2:-5}
sort -n $filename | tail -$count
