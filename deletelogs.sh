#!/bin/bash
source_path=/home/ec2-user/app-logs
files_old= $(find $source_path -name "*.log" -mtime "+14")


while IFS = read -r file
do
rm -rf $file
done <<< $files_old