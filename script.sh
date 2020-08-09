#!/bin/bash
COMMIT_COUNT=8

#cd "$(dirname "$(readlink -f "${0}")")"

mkdir -p dummy
cd dummy

FILE=1
while [ -f "$FILE" ]
do
	((FILE=FILE+1))
done

COUNT=0
while [ $COUNT -lt $COMMIT_COUNT ]
do
	echo $COUNT >> $FILE
	git add .
	git commit -m "[$FILE-$COUNT]"
	((COUNT=COUNT+1))
done

git push origin master
