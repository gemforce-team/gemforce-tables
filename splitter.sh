#!/bin/bash
set -e

if [[ -n "$1" ]]
then
	list=$1
else
	list="table_*"
	echo -n "" > .gitignore
fi


for file in ${list}
do
	if [ -f "$file" ]
	then
		size=$(wc -c < "$file")
		if [ "$size" -gt 50000000 ]
		then
			echo "Splitting $file"
			split -C 50M "$file" "${file}_p" -d
			
			mkdir -p "${file}.d"
			mv "$file"_p* "${file}.d"
			
			[[ -z $1 ]] && echo "$file" >> .gitignore
		fi
	fi
done

