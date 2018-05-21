#!/bin/sh
peerlist="/usr/local/etc/bird/peerlist.txt"
outputpath="/usr/local/etc/bird/"

while IFS=' ' read -r f1 f2 f3
do
	outputfile="${f1}-v${f2}-nets.conf"
	preflistname="${f1}_v$f2"
	
	echo "function ${preflistname}_nets()"  > $outputpath$outputfile
	echo "prefix set ${preflistname};" >> $outputpath$outputfile
	echo "{" >> $outputpath$outputfile
	bgpq3 -$f2 -b -l $preflistname $f3  >> $outputpath$outputfile
	echo "if net ~ $preflistname then return true;" >> $outputpath$outputfile
	echo "return false;" >> $outputpath$outputfile
	echo "}" >> $outputpath$outputfile

done <"$peerlist"

birdc conf
