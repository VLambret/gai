#! /bin/bash


HEIGHT=500
WIDTH=500
FILE_COUNTER=0
PREFIX="out/output_"
CONTENT=
declare -A COMMITS

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
	for i in "${!COMMITS[@]}"
	do
		echo ${COMMITS[$i]}
	done
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
	NAME=$1
	X=$2
	Y=$3
	COLOR=$4

	C=$(echo "<circle cx=\"$X\" cy=\"$Y\" r=\"20\" stroke=\"black\" stroke-width=\"3\" fill=\"$COLOR\" />")
	COMMITS[$NAME]=$C
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
