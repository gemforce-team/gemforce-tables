#!/bin/bash

for folder in *.d
do
    file=$(echo ${folder} | cut -d '.' -f 1)  
    echo "Joining ${file}"
    cat "${folder}/${file}_p*" > $file
done
