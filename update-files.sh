#!/bin/bash

tracked=$PWD/'tracked.txt'
dest=$PWD/'files'

if [ ! -e $tracked ]; then
	echo 'tracked.txt is missing.'
	exit
fi

if [ ! -d $dest ]; then
	mkdir $dest
fi

lastchar=$(tail -c 1 $tracked)
lastchar=$(printf "%d" "'$lastchar")
if [[ ! ($lastchar -eq 0 || $lastchar -eq 10) ]]; then
	echo '' >> $tracked
fi

input="$tracked"
while IFS= read -r line
do
	args=($line)
	source=${args[0]}

	if [[ ${#args[@]} -gt 1 ]];then 
		dest_name=${args[1]}
	else
		dest_name=$(basename $source)
	fi

	source=$(echo $source | sed -e 's/$USER/'$USER'/')
	cp -u $source $dest/$dest_name
	if [[ $? -eq 0 ]]; then
		echo 'Updated '$dest_name' from '$source
	else
		echo 'Failed to update '$source
	fi
done < "$input"