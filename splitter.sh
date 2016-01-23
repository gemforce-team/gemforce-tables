#!/bin/bash

echo -n "" > .gitignore

for file in table_*
do
	if [ -f $file ]
	then
		size=$(wc -c "$file" | cut -f 1 -d ' ')
		if [ $size -gt 50000000 ]
		then
			echo "Splitting $file"
			split -C 50M $file "$file""_p" -d
			mkdir -p "$file"".d"
			for part in "$file"_p*
			do
				mv "$part" "$file"".d"
			done
			echo $file >> .gitignore
		fi
	fi
done

