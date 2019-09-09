#!/bin/bash
# GNU bash, version 4.3.46
declare -a arr
declare -a arr2
declare h=0

echo "Please enter the first word and press enter:";
read input1
echo "Please enter the second word and press enter:";
read input2
var1=${input1^^}
var2=${input2^^}

c1=${#var1}
c2=${#var2}
c3=$((c1-1))
if [ $c1 = $c2 ]
then for ((c=0; c<=c3; c++)); do arr[$c]=${var1:c:1} && arr2[$c]=${var2:c:1} && if [ ${arr2[c]} != ${arr[c]} ]
        then let ++h
        fi; 
done
else
echo "The number of the characters are not equal, the program has stopped" && exit 1
fi;

if [ h>0 ]
	then echo Hamming distance: $h
	else echo Hamming distance: $h
fi;

