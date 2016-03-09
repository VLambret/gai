#! /bin/bash

HEIGHT=500
WIDTH=500

HEADER="<svg height=\"${HEIGHT}\" width=\"${WIDTH}\">"
FOOTER="</svg>"

function print_commit
{
	X=$1
	Y=$2
	COLOR=$3
	echo "<circle cx=\"$X\" cy=\"$Y\" r=\"20\" stroke=\"black\" stroke-width=\"3\" fill=\"$COLOR\" />"
}

function generate_file
{
	echo $HEADER
	print_commit 100 100 red
	echo $FOOTER
}

generate_file >> sample.svg
