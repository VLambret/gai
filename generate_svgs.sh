#! /bin/bash

HEIGHT=500
WIDTH=500
FILE_COUNTER=0
PREFIX="out/output_"
CONTENT=

function header
{
	echo "<svg height=\"${HEIGHT}\" width=\"${WIDTH}\">"
}

function footer
{
	echo "</svg>"
}

function content
{
	echo $CONTENT
}

function generate_file
{
	FILENAME=${PREFIX}$(printf "%04d" $FILE_COUNTER).svg
	FILE_COUNTER=$(($FILE_COUNTER + 1))

	header > $FILENAME
	content >> $FILENAME
	footer >> $FILENAME
}

function commit
{
	X=$1
	Y=$2
	COLOR=$3
	CONTENT+=$(echo "<circle cx=\"$X\" cy=\"$Y\" r=\"20\" stroke=\"black\" stroke-width=\"3\" fill=\"$COLOR\" />")
}


function factory
{
	INSTRUCTION_FILE=$1
	while read i;
	do
		$i
	done < $INSTRUCTION_FILE;
}

#generate_file >> sample.svg
factory instructions.vit
